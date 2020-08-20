class Item < ApplicationRecord

belongs_to :user
has_one :buy
has_one_attached :image

validates :name, presence: true
validates :detail, presence: true
validates :category_id, presence: true
validates :condition_id, presence: true
validates :postage_id, presence: true
validates :prefecture_id, presence: true
validates :delivery_id, presence: true
validates :price, presence: true
validates_inclusion_of :price, in: 300..9999999

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage
belongs_to_active_hash :prefecture
belongs_to_active_hash :delivery

end
