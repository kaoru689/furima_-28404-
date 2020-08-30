class BuysAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{11}\z/, message: "is telephone_number. exceeds 11 characters."}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥 a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :house_number, format: { with: /[0-9\._¥+-]/, message: "is invalid. Input width characters."}
    end
   validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    
   def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number,buy_id: buy.id)
    end
  
end