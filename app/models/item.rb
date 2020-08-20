class Item < ApplicationRecord

belongs_to :user
has_one :buy

validates :category_id, presence: true
validates :condition_id, presence: true
validates :postage_id, presence: true
validates :prefecture_id, presence: true

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  

end
