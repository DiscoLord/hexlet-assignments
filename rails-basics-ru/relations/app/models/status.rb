# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_many :tasks, dependent: :nullify

  validates :name, presence: true
  # END
end
