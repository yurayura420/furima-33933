class OrdersController < ApplicationController

  def index
    
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)   
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  private
  def order_params
    params.require(:order_address).permit(:address_number, :area_id, :city, :house_number, :house_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end  

end
