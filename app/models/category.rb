class Category < ApplicationRecord
  has_many :book
  has_ancestry
end