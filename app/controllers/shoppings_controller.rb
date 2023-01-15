class ShoppingsController < ApplicationController

  def index
    @shopping_shipping_address = ShoppingShippingAddress.new
  end
  
  def create
    @shopping_shipping_address = ShoppingShippingAddress.new(shopping_params)
    if @shopping_shipping_address.valid?
      @shopping_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
    def shopping_params
      params.require(:shopping_shipping_address).permit(:postal_code, :area_id, :city, :house_number, :phone_number, :building_name, :price).merge(user_id: current_user.id)
    end
end
