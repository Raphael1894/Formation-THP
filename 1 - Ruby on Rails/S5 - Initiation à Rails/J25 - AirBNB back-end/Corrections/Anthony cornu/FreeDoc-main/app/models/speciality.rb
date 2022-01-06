class Speciality < ApplicationRecord
    has_many :join_doctors_specialities
    has_many :doctors, through: :join_doctors_specialities
end
