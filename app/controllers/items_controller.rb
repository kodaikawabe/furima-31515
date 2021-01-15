class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroye]

  def index
    @items = Item.all.order("created_at DESC")
  end

  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get 
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id,
                                 :status_id, :shipping_charges_id, :area_id, :date_of_shipment_id,
                                 :item_info, :image).merge(user_id: current_user.id)
  end
end
