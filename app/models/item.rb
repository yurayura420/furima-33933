class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_date
  belongs_to :category


end
