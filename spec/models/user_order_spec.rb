require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンが含まれていないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code code Input correctly")
    end
    it 'prefectures_idが1だと保存できないこと' do
      @user_order.prefectures_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefectures Select")
    end
    it 'municipal_districtが空だと保存できないこと' do
      @user_order.municipal_district = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipal district can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @user_order.address = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @user_order.phone_number = '０９０１２３４５６７８'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @user_order.phone_number = '090123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number Input only number")
    end
    it 'tokenが空だと保存できないこと' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_order.building_name = ''
      expect(@user_order).to be_valid
    end
  end
end

