class OrderAddress
  include ActiveModel::Model
  attr_accessor :address_number, :area_id, :city, :house_number, :house_name, :phone_number, :user_id, :item_id, :token

  ADDRESS_REGEX = /\A\d{3}-\d{4}\z/
  PHONE_REGEX = /\A\d{10,11}\z/
  with_options presence: true do
    validates_format_of :address_number, with: ADDRESS_REGEX
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates_format_of :phone_number, with: PHONE_REGEX
    validates :user_id
    validates :item_id
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(address_number: address_number, area_id: area_id, city: city, house_number: house_number,
                   house_name: house_name, phone_number: phone_number, order_id: order.id)
  end
end
