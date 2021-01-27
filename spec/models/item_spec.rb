require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'itemの保存' do
    context "正常系" do
      it "必要な値が全てあれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context "異常系" do
      it "nameが空では投稿できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end     
      it "descriptionが空では投稿できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "imageが空では投稿できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "category_idが１だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end     
      it "state_idが１だと登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end  
      it "shipping_fee_idが１だと登録できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee must be other than 1"
      end     
      it "area_idが0だと登録できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 0"
      end  
      it "shipping_date_idが１だと登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date must be other than 1"
      end     
      it "priceが空では投稿できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end 
      it "priceが半角英語のみだと登録できない" do
        @item.price = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end     
      it "priceが半角英数混合だと登録できない" do
        @item.price = "a1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end     
      it "priceが全角文字だと登録できない" do
        @item.price = "あ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end     
      it "priceが300未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end     
      it "priceが10000000以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end     
      it "ユーザーが紐付いていなければ投稿できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
