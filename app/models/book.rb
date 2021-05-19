class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user
  belongs_to :category
  belongs_to_active_hash :publisher_code
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :publisher_code_id, presence: true
  validates :condition_id, presence: true
  validates :preparation_day_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates_inclusion_of :price, in: 100..9999999
  validates :item_images, presence: true
end
