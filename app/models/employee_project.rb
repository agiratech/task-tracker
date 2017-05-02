# frozen_string_literal: true
# this is the association table to employee, project & role
class EmployeeProject < ApplicationRecord
  belongs_to :employee
  belongs_to :project
  belongs_to :role
end
