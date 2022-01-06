class User < ApplicationRecord
    has_many :events, through: :attendances
    #un user peut administrer plusieurs evenements
    has_many :events, through: :users 
    has_many :attendances 

# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
