class ItemsController < ApplicationController
  skip_before_action :authenticate_user! ,only: [:index, :show, :edit]
  before_action :set_item , only: [:show, :update, :edit, :destroy]
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
  end


  def update
    @item.update(item_params) if current_user.id == @item.user.id
    return redirect_to item_path(@item) if @item.valid?
    
       render :edit
  end
  

  def edit
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
   

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end
end
