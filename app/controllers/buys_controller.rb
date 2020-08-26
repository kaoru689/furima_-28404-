class BuysController < ApplicationController

  def create
    @buys = Buys.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :edit
    end
  end

  private

  def buys_params
    params.permit(:price, :token)
  end
  
  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
