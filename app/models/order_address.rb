class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :ship_to_area_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :ship_to_area_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    @order_address = Address.create(postcode: postcode, ship_to_area_id: ship_to_area_id, city: city, block: block,
                                    building: building, phone_number: phone_number, order_id: order.id)
  end
end
