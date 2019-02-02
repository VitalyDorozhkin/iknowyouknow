class Order < ApplicationRecord
  belongs_to :service
  belongs_to :student, class_name:  "User"
  has_one :teacher, class_name: "User", through: "service", source: "teacher"

end
