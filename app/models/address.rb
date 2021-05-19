class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture

  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/
  
  validates :address_first_name, presence: true, format: { with: VALID_NAME}
  validates :address_family_name, presence: true, format: { with: VALID_NAME}
  validates :address_first_name_kana, presence: true, format: { with: VALID_NAME_KANA}
  validates :address_family_name_kana, presence: true, format: { with: VALID_NAME_KANA}
  validates :prefecture_id, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :address_line, presence: true

end
