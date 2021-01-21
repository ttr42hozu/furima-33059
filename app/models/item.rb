class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :ship_to_area
  belongs_to :ship_to_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :ship_to_area_id
    validates :ship_to_day_id
  end

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :ship_to_area_id
    validates :ship_to_day_id
    validates :price
    validates :image
  end
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than: 10_000_000 }
end
