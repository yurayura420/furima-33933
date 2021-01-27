class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_items, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new  
    end 
  end   
  def show
 
  end
  def edit
    
  end

    private
    def item_params
      params.require(:item).permit(:image,:name,:description,:category_id,:state_id,:shipping_fee_id,:area_id,:shipping_date_id,:price).merge(user_id: current_user.id)
    end  
    def set_items
      @item = Item.find(params[:id])
    end  
    def move_to_index
      unless user_signed_in? && @item.user.id == current_user.id
        redirect_to action: :index
      end
    end
end
