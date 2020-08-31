class BuysAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id
  
  with_options presence: true do
    POSTALE_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    TELEPHONE_NUMBER_REGEX = /\A\d{11}\z/
    CITY_REGEX = /\A[ぁ-んァ-ン一-龥 a-zA-Z0-9]+\z/
    HOUSE_NUMBER_REGEX = /[0-9\._¥+-]/
    validates :postal_code, format: {with: POSTALE_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: TELEPHONE_NUMBER_REGEX, message: "is telephone_number. exceeds 11 characters."}
    validates :city, format: { with: CITY_REGEX, message: "is invalid. Input full-width characters."}
    validates :house_number, format: { with: HOUSE_NUMBER_REGEX, message: "is invalid. Input width characters."}
    end
   validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    
   def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number,buy_id: buy.id)
    end
  
end