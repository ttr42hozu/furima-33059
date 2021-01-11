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
end
