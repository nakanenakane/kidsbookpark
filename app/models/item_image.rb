class ItemImage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  mount_uploader :image, ItemImageUploader
  belongs_to :book
  belongs_to_active_hash :prefecture
end