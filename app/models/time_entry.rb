# frozen_string_literal: true
# timeentry model related to employee and project
class TimeEntry < ApplicationRecord
  belongs_to :employee
  belongs_to :project
end
