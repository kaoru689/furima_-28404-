class ItemsController < ApplicationController
  # skip_before_action :authenticate_user! ,only: :index
  def index
    @items = Item.all
    @items = Items.order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:item_id)
  end
end

