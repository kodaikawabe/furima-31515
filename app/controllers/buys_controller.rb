class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  before_action :soldout_item

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(buy_params)
    if @user_order.valid?
      @user_order.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:user_order).permit(:postal_code, :prefectures_id, :municipal_district, :address,
                                       :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def soldout_item
    redirect_to root_path if @item.buy.present?
  end
end
