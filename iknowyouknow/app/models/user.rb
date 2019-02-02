class User < ApplicationRecord
  validates :name, length: {minimum: 3}
  validates :lastname, length: {minimum: 3}
  validates :age, presence: true


  belongs_to :user_role

  #teacher methods
  has_many :services, class_name: "Service", foreign_key: "teacher_id"

  has_many :teacher_orders, class_name: "Order", foreign_key: "teacher_id", through: "services", source: "orders"

  has_many :students, through: "teacher_orders", class_name: "User", source: "student"


  #student methods
  has_many :orders, foreign_key: "student_id"

  has_many :student_services, through: "orders", class_name: "Service", source: "service"

  has_many :teachers, through: "student_services", class_name: "User", source: "teacher"

end
