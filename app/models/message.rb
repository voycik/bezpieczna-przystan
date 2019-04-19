# frozen_string_literal: true

class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :body
  validates :name, :email, :body, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :email, email: true
end
