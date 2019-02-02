class Service < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  has_many :orders
  has_many :students, through: "orders", class_name: "User", source: "student"
end
