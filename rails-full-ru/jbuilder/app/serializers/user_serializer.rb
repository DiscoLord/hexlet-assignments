# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :address

  has_many :posts

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
