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
    validates :first_name, format: { with: NAME_REGEX, message: "は全角日本語で入力してください"}
    validates :last_name, format: { with: NAME_REGEX , message: "は全角日本語で入力してください"}
    validates :first_name_kana, format: { with: KANA_REGEX , message: "は全角カタカナで入力してください"}
    validates :last_name_kana, format: { with: KANA_REGEX , message: "は全角カタカナで入力してください"}
    validates :nickname, format: { with: NICKNAME_REGEX , message: "を入力してください"}
    validates :password, format: { with: PASSWORD_REGEX , message:"は英数混合で入力してください"}
    validates :birthday
  end
end
