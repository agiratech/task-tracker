# frozen_string_literal: true
# project model
class Project < ApplicationRecord
  has_many :employee_projects
  has_many :employees, through: :employee_projects

  has_many :time_entries
end
