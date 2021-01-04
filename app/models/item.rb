class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :status_id
    validates :shipping_charges_id
    validates :area_id 
    validates :date_of_shipment_id
    validates :item_info
  end
end
