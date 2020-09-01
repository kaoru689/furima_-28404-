class Item < ApplicationRecord

belongs_to :user
has_one :buy
has_one_attached :image

with_options presence: true do
validates :image
validates :name
validates :detail
validates :category_id
validates :condition_id
validates :postage_id
validates :prefecture_id
validates :delivery_id
validates :price
end
validates_inclusion_of :price, in: 300..9999999

with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :postage_id
  validates :prefecture_id
  validates :delivery_id
end


extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage
belongs_to_active_hash :prefecture
belongs_to_active_hash :delivery

end
