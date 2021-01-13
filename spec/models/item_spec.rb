require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context "商品が出品できる場合" do
      it "image,name,item_info,price,category_id,status_idshipping_charges_id,
      area_id,date_of_shipment_idがあれば投稿できる" do
      expect(@item).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "nameが空では出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it "item_infoが空では出品できない" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では出品できない" do
        @item.price = '３００'
        @item.valid?
        binding.pry
      end
    end
  end
end
