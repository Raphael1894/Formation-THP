
class User
  attr_accessor :email, :age
  @@all_users = Array.new

  def initialize(email_to_save, user_age)
    @email = email_to_save.to_s
    @age = user_age.to_i
    @@all_users << self    
  end

  def self.all_users 
    return @@all_users
  end

end
