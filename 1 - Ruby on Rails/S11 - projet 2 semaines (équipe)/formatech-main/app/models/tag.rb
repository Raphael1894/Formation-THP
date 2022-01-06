# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :fields
  has_many :courses, through: :fields

  validates :name, presence: true
  validates :description, presence: true
end
