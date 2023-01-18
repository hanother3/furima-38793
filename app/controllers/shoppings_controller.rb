class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay, only: [:index, :create]

  def index
    if current_user == @item.user || @item.shopping.present?
      redirect_to root_path 
    end
    @shopping_shipping_address = ShoppingShippingAddress.new
  end
  
  def create
    @shopping_shipping_address = ShoppingShippingAddress.new(shopping_params)
    if @shopping_shipping_address.valid?
      pay_item
      @shopping_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def shopping_params
    params.require(:shopping_shipping_address).permit(:postal_code, :area_id, :city, :house_number, :phone_number, :building_name, :price).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_params[:token],
      currency: 'jpy'
    )
  end  

  def set_pay
    @item = Item.find(params[:item_id])
  end

end
