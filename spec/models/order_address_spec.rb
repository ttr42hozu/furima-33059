require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '購入できる場合' do
    it 'postcode, ship_to_area_id, city, block, phone_number, tokenが存在すれば保存できる' do
      expect(@order_address).to be_valid
    end
  end

  context '購入できない場合' do
    it 'tokenが空の場合は購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postcodeが空の場合は購入できない' do
      @order_address.postcode = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end

    it 'postcodeが全角数字の場合購入できない' do
      @order_address.postcode = "１２３-４５６７"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid")
    end

    it 'postcodeが-なしの場合購入できない' do
      @order_address.postcode = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid")
    end

    it 'postcodeが-の位置が違う場合購入できない' do
      @order_address.postcode = "1-234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid")
    end

    it 'ship_to_area_idが空の場合購入できない' do
      @order_address.ship_to_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship to area can't be blank")
    end

    it 'ship_to_area_idが1の場合購入できない' do
      @order_address.ship_to_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship to area must be other than 1")
    end

    it 'cityが空の場合購入できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'blockが空の場合購入できない' do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end

    it 'phone_numberが空の場合購入できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが全角数字の場合購入できない' do
      @order_address.phone_number = "１２３４５６７８９０１"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberの桁数が11桁より少ない場合購入できない' do
      @order_address.phone_number = 1234567890
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberの桁数が11桁より多い場合購入できない' do
      @order_address.phone_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberに-が含まれている場合購入できない' do
      @order_address.phone_number = 123-4567-8901
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end