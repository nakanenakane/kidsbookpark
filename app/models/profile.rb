class Profile < ApplicationRecord
  belongs_to :user

  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :first_name, presence: true, format: { with: VALID_NAME}# ここがユーザー本名全角の正規表現
  validates :family_name, presence: true, format: { with: VALID_NAME}# ここがユーザー本名全角の正規表現
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA}# ここがフリガナ全角の正規表現
  validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA}# ここがフリガナ全角の正規表現

end
