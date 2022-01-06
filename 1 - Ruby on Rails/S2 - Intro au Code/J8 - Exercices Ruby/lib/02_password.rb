def signUp
  puts "Welcome ! Could you please inform us of a new password?"
  print "New password : "
  password = gets.chomp
  puts "Saving password."
  sleep 0.5
  puts "password saved."
  sleep 1
  return password
end



def login(password)
  puts "Hi once again. Please insert your pasword to go further"
  print ">"
  verifyPassword = gets.chomp
  if password == verifyPassword 
    puts "password accepted."
  else 
    abort("Wrong password, try again later.")
    
  end 
end


def welcomeScreen
  puts "Welcome to your Home Screen"
  sleep 1
  puts "Here is all the valuable data"
  sleep 1.5
  puts "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, 
  pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. 
  Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, 
  in pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent
  per conubia nostra, per inceptos himenaeos. Duis pharetra luctus lacus ut 
  vestibulum. Maecenas ipsum lacus, lacinia quis posuere ut, pulvinar vitae dolor."
end


def perform
  password = signUp
  login(password)
  welcomeScreen
end

perform