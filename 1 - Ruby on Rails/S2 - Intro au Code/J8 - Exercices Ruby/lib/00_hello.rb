
def askFirstName
  puts "Quel est ton prénom ?"
  print "> "
  firstName = gets.chomp
  return firstName
end




def sayHello (firstName)
  puts "Bonjour, #{firstName} !"
end


def perform
  firstName = askFirstName
  sayHello(firstName)
end

perform