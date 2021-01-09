class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :date_of_shipment
  belongs_to :shipping_charges
  belongs_to :area

  with_options presence: true do
    validates :name
    validates :price
    validates :item_info
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :area_id 
    validates :date_of_shipment_id
  end

end
