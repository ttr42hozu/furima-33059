require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '保存できる場合' do
    it 'image, title, discription, category_id, status_id, shipping_charge_id, ship_to_area_id, ship_to_day_id, price, user_idが存在すれば保存できる' do
      expect(@item).to be_valid
    end
  end
  context '保存できない場合' do
    it '商品画像が空の場合、保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空の場合、保存できない' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空の場合、保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリー情報が空の場合、保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が空の場合、保存できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担についての情報が空の場合、保存できない' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it '発送元の地域についての情報が空の場合、保存できない' do
      @item.ship_to_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship to area can't be blank")
    end
    it '発送までの日数についての情報が空の場合、保存できない' do
      @item.ship_to_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship to day can't be blank")
    end
    it '価格についての情報が空の場合、保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が300以下の場合、保存できない' do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が9999999以上の場合、保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end
    it '価格が半角数字ではない場合、保存できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
