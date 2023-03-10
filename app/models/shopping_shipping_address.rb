class ShoppingShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。次のように入力してください (例:123-4567)' }
    validates :city, :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, :item_id, :token
  end
  validates :area_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    shopping = Shopping.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
                           building_name: building_name, phone_number: phone_number, shopping_id: shopping.id)
  end
end
