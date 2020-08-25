class ItemsController < ApplicationController
  skip_before_action :authenticate_user! ,only: [:index, :show]
  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    begin
    @items = Item.find(params[:id])
    @items.update(item_params)
  rescue => error
    render :new
  end
end

  def edit
    begin
      @items = Item.find(params[:id])
      @items.edit(item_params)
    rescue => error
      render :show
  end
end
   

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end
end
