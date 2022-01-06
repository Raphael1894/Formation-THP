# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, presence: true,
                      length: { maximum: 500 }
end
