# frozen_string_literal: true

class Post < ApplicationRecord
  # BEGIN
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  # END

  validates :title, presence: true
end
