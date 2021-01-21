class BuysController < ApplicationController

  def index
    @usre_orser = UserOrder.new(buys_params)
  end

  def create
  end

  private
  def buys_params
    params.require(:user_order).permit(:postal_code, :prefectures_id, :municipal_district,:address,
      :building_name, :phone_number, :user_id,:item_id, :token)
 end
end
