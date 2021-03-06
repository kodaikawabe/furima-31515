class Item < ApplicationRecord
  belongs_to :user
  has_one :buy, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :date_of_shipment
  belongs_to :shipping_charges
  belongs_to :area

  with_options presence: true do
    validates :image
    validates :name
    validates :item_info
    validates :price
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :area_id
    validates :date_of_shipment_id
  end
end
