require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品登録できるとき' do
      it '全ての項目が存在し、価格が適切であれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが¥300以上でないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it 'priceは¥¥9,999,999以下でないと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'priceは半角数値でないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'delivery_time_idが空では登録できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
