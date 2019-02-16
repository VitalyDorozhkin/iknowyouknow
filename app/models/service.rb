class Service < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  belongs_to :teacher, class_name: "User"
  has_many :orders
  has_many :students, through: "orders", class_name: "User", source: "student"
  belongs_to :subject
  has_one :category, through:"subject", source: "category"
end
