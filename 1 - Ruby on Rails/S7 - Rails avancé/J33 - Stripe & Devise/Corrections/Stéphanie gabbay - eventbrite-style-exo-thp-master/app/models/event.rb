class Event < ApplicationRecord
validates :title, presence: true
validates :start_date, presence: true

validates :duration, presence: true
   if 5.times do |m| 

validates :description, length: { in: 20..1000 }
validates :price, presence: true
has_many :attendances
has_many :users, through: :attendances 
belongs_to :user
    end
end
end

