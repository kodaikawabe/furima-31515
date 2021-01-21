class BuysController < ApplicationController

  def index
    @user_order = UserOrder.new(buy_params)
  end

  def create
  end

  private
  def buy_params
    params.require(:user_order).permit(:postal_code, :prefectures_id, :municipal_district,:address,
      :building_name, :phone_number, :user, :item)
 end
end
