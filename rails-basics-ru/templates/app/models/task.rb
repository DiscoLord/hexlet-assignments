class Task < ApplicationRecord
  validates :name, :description, :status, :creator, presence: true
end
