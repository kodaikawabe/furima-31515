class BuysController < ApplicationController

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(buy_params)
    if @user_order.valid?
      @user_order.save
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:user_order).permit(:postal_code, :prefectures_id, :municipal_district,:address,
      :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
 end
end
