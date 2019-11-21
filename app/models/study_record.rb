class StudyRecord < ApplicationRecord
  attr_accessor :hour, :min
  belongs_to :user
  belongs_to :category
end
