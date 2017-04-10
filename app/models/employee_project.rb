class EmployeeProject < ApplicationRecord
  belongs_to :employee
  belongs_to :project
  belongs_to :role
end
