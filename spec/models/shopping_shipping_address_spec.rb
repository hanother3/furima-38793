require 'rails_helper'

RSpec.describe ShoppingShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      sleep(1)
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shopping_shipping_address = FactoryBot.build(:shopping_shipping_address, item_id: item.id, user_id: item.user.id)
    end

    context '購入出来る場合' do
      it 'すべての値とtokenが正しく入力されていれば保存できること' do
        expect(@shopping_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @shopping_shipping_address.building_name = ''
        expect(@shopping_shipping_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @shopping_shipping_address.postal_code = ''
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_shipping_address.postal_code = '1234567'
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include('郵便番号は不正な値です。次のように入力してください (例:123-4567)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @shopping_shipping_address.area_id = '1'
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと保存できないこと' do
        @shopping_shipping_address.city = ''
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できないこと' do
        @shopping_shipping_address.house_number = ''
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @shopping_shipping_address.phone_number = ''
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @shopping_shipping_address.phone_number = '123456789'
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @shopping_shipping_address.phone_number = '123456789012'
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが半角数字以外が含まれていると保存できないこと' do
        @shopping_shipping_address.phone_number = '090-1234-5678'
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'userが紐付いていないと保存できないこと' do
        @shopping_shipping_address.user_id = nil
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @shopping_shipping_address.item_id = nil
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では登録できないこと' do
        @shopping_shipping_address.token = nil
        @shopping_shipping_address.valid?
        expect(@shopping_shipping_address.errors.full_messages).to include("トークンを入力してください")
      end
    end
  end
end
