class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    KANA_REGEX = /\A[ァ-ヶー－]+\z/
    NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥 a-zA-Z0-9]+\z/
    PASSWORD_REGEX = /\A[a-z]+[\d]+[a-z\d]+\z/
    validates :first_name, format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :last_name, format: { with: NAME_REGEX , message: "is invalid. Input full-width characters."}
    validates :first_name_kana, format: { with: KANA_REGEX , message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana, format: { with: KANA_REGEX , message: "is invalid. Input full-width katakana characters."}
    validates :nickname, format: { with: NICKNAME_REGEX , message: "is invalid. Input width characters."}
    validates :password, format: { with: PASSWORD_REGEX , message:"is invalid. Input half-width characters."}
    validates :birthday
  end
end
