class User < ApplicationRecord
  validates :name, length: {minimum: 3}
  validates :lastname, length: {minimum: 3}
  validates :age, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
  validates :login, uniqueness: true, length: {minimum: 3, maximum: 20}


  before_validation :set_user_role


  has_one_attached :avatar

  belongs_to :user_role

  #teacher methods
  has_many :services, class_name: "Service", foreign_key: "teacher_id"

  has_many :teacher_orders, class_name: "Order", foreign_key: "teacher_id", through: "services", source: "orders"

  has_many :students, through: "teacher_orders", class_name: "User", source: "student"

  has_many :teacher_subjects, through: "services", class_name: "Subject", source: "subject"

  has_many :teacher_categories, through: "teacher_subjects", class_name: "Category", source: "category"

  #student methods
  has_many :orders, foreign_key: "student_id"

  has_many :student_services, through: "orders", class_name: "Service", source: "service"

  has_many :teachers, through: "student_services", class_name: "User", source: "teacher"

  has_many :student_subjects, through: "student_services", class_name: "Subject", source: "subject"

  has_many :student_categories, through: "student_subjects", class_name: "Category", source: "category"
  def admin?
    self.user_role.status == "admin"
  end


  def services_of_student(teacher)
    self.student_services.where(teacher: teacher)
  end

  def set_user_role
    self.user_role||= UserRole.find_by_status('user')
  end

  def other_services user
    res = []
    self.services.each do |s|
      if(!s.students.include?(user))
        res.push(s);
      end
    end
    res
  end














end
