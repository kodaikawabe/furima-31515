class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipal_district,:address,
                :building_name, :phone_number, :user_id,:item_id, :token              

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, 
                                     message: "code Input correctly"}
    validates :prefectures_id, numericality: { other_than: 1, 
                                      message: "Select" }
    validates :municipal_district
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ ,
                                       message: "Input only number"}
    
  end

    


    def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code,  prefectures_id: prefectures_id, municipal_district: municipal_district, 
                     address: address, building_name: building_name, phone_number: phone_number
                     )
    end
    
end