require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    # binding.pry
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id:item.id)
    sleep 0.1 
  end
  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての値が正常なら登録できる' do
        expect(@order_address).to be_valid
      end
      it 'house_nameが空でも登録できる' do
        @order_address.house_name = ''
        expect(@order_address).to be_valid
      end
      it 'phone_numberが10桁なら登録できる' do
        @order_address.phone_number = '0000000000'
        expect(@order_address).to be_valid
      end
    end
    context '異常系' do
      it 'address_numberが空では登録できない' do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid')
      end
      it 'address_numberに-が無いと登録できない' do
        @order_address.address_number = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address number is invalid')
      end
      it 'area_idが０では登録できない' do
        @order_address.area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 0')
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁未満では登録できない' do
        @order_address.phone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが全角数字では登録できない(11桁)' do
        @order_address.phone_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
