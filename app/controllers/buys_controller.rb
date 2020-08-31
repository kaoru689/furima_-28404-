class BuysController < ApplicationController
      before_action :set_item , only: [:index, :create]

  def index
  if  current_user.id == @item.user.id
      @item_id == nil
      redirect_to root_path
  end
  end

  def new
      @buys = BuysAddress.new
  end

  def create
      @buys = BuysAddress.new(buys_params)
  if  @buys.valid?
      pay_item
      @buys.save
      redirect_to root_path
  else
      redirect_to item_path(@item.id)
  end
  end

  private

  def set_item
      @item = Item.find(params[:item_id])
  end

  def buys_params
      params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
