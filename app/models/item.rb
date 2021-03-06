class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  with_options presence: true do
    validates :name
    validates :description
    validates :state_id, numericality: { other_than: 1 }
    validates :shipping_fee_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 0 }
    validates :shipping_date_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true }
    validates :image
  end

  validates_inclusion_of :price, in: 300..9_999_999

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_date
  belongs_to :category
end
