class User < ApplicationRecord
  validates :name, length: {minimum: 3}
  validates :lastname, length: {minimum: 3}
  validates :age, presence: true
  validates :password, presence: true
  validates :login, uniqueness: true

  before_validation :set_user_role


  has_one_attached :avatar

  belongs_to :user_role

  #teacher methods
  has_many :services, class_name: "Service", foreign_key: "teacher_id"

  has_many :teacher_orders, class_name: "Order", foreign_key: "teacher_id", through: "services", source: "orders"

  has_many :students, through: "teacher_orders", class_name: "User", source: "student"


  #student methods
  has_many :orders, foreign_key: "student_id"

  has_many :student_services, through: "orders", class_name: "Service", source: "service"

  has_many :teachers, through: "student_services", class_name: "User", source: "teacher"

  def admin?
    self.user_role.status == "admin"
  end


  def services_of_student(teacher)
    self.student_services.where(teacher: teacher)
  end

  def set_user_role
    self.user_role||= UserRole.find_by_status('user')
  end














end
