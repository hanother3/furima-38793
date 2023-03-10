class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :delivery_time
  has_one    :shopping, dependent: :destroy

  with_options presence: true do
    validates :image, :item_name, :item_description, :price
  end  

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :item_condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :area_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "を入力してください" }
end
