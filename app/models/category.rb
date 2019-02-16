class Category < ApplicationRecord
  has_many :subjects
  has_many :services, through: :subjects
end
