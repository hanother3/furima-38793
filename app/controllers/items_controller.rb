class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end  

  private
  def item_params
    params.require(:item).permit(
      :image, :item_name, :item_description, :category_id, :item_condition_id, :delivery_charge_id, :area_id, :delivery_time_id, :price
        ).merge(user_id: current_user.id)
  end

end
