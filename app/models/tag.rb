class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :stories, through: :taggings
end
