def welcome
  puts "Let's start a new game"
  sleep 0.5
  loop do
  puts "If you want to play, enter 1, if you want to read the instructions, enter 2. Press any key if you want to quit."
  print ">"
  menuChoice = gets.chomp.to_i
    if menuChoice == 1
      puts "Let's begin"
      sleep 1
      break 
    elsif menuChoice == 2
      puts "--*-- Jeu de l'escalier --*--"
      sleep 1
      puts "L'objectif de ce jeu est d'atteindre la dernière marche"
      puts "Tu vas lancer un dé compris entre 1 et 6. Selon le résultat trois évênements peuvent se passer :"
      puts "- Si tu fait un 5 ou un 6, tu avance d'une marche"
      puts "- si tu fait un 1, tu descend d'une marche"
      puts "- Si tu fait un 2, 3 ou un 4, rien ne se passe"
      sleep 1
      puts "Arrivera-tu a atteindre la dixième marche le plus rapidement possible?"
      sleep 1.5
    else
      abort("We hope to see you again.")
    end 
  end
end

def diceThrowing(playerPosition)  
  loop do
    puts "If you want to throw your dice, enter 1, if you want to read the instructions, enter 2. Press any key if you want to quit."
    print ">"
    diceChoice = gets.chomp.to_i
    if diceChoice == 1
      puts "Dice thrown"
      sleep 0.6
      puts "3"
      sleep 0.2
      puts "2"
      sleep 0.2
      puts "1"
      sleep 0.2
      diceResult = rand(1...6)
      #puts "dice result  #{diceResult}"
      sleep 0.8     
      playerPosition = playerPosition.to_i
      #puts "before calcul #{playerPosition}"
      #puts "dice result #{diceResult}"
      if playerPosition < 0
        playerPosition = 0
        #puts "went into pp < 0"
        #puts "after pp #{playerPosition}"
      else
        playerPosition = playerPosition
        #puts "went into pp = pp"   
      end 
        if diceResult == 1 
          playerPosition = playerPosition - 1
          #puts "after calcul  -1   #{playerPosition}"
          return playerPosition
        elsif diceResult == 5
          playerPosition = playerPosition + 1
          #puts "after calcul  +1   #{playerPosition}"
          return playerPosition
        elsif diceResult == 6
          playerPosition = playerPosition + 1
          #puts "after calcul  +1   #{playerPosition}"
          return playerPosition
        elsif diceResult == 2
          playerPosition = playerPosition
          #puts "after calcul  0   #{playerPosition}"
          return playerPosition          
        elsif diceResult == 3
          playerPosition = playerPosition
          #puts "after calcul  0   #{playerPosition}"
          return playerPosition
        else diceResult == 4
          playerPosition = playerPosition
          #puts "after calcul  0   #{playerPosition}"
          return playerPosition
        end
      break
    elsif diceChoice == 2
      puts "--*-- Jeu de l'escalier --*--"
      sleep 1
      puts "L'objectif de ce jeu est d'atteindre la dernière marche"
      puts "Tu vas lancer un dé compris entre 1 et 6. Selon le résultat trois évênements peuvent se passer :"
      puts "- Si tu fait un 5 ou un 6, tu avance d'une marche"
      puts "- si tu fait un 1, tu descend d'une marche"
      puts "- Si tu fait un 2, 3 ou un 4, rien ne se passe"
      sleep 1
      puts "Arrivera-tu a atteindre la dixième marche le plus rapidement possible?"
      sleep 1.5
    else
      abort("We hope to see you again.")
    end 
  end
end

def staircaseGame(playerPosition, staircaseGameWon)
  #puts "before drawing #{playerPosition}"
  numStair = 9.to_i
  #playerPosition = 0
  x = 15# Set number of rows
  i = 1
stairLength = 1 
  if playerPosition == 10
    staircaseGameWon = true
  else
    staircaseGameWon = false
    if playerPosition < 0
      playerPosition = 0
      #puts "went into pp < 0"
      #puts "after pp #{playerPosition}"
    else
      playerPosition = playerPosition
      #puts "went into pp = pp"   
    end 
    #puts "after regul #{playerPosition}"
    actualStair = playerPosition.to_i
    puts "10"
    10.times do   
      if actualStair == numStair 
        print "0"
        print "#{numStair}  "
        print '#' * (i-1) + ('#' * stairLength) 
        print '#' * 5 
        print '  X'       
        #print "          #{stairLength}"
        print "\n"
        x -= 1
        i += 1
        numStair = numStair - 1
        stairLength = stairLength + 2
      else
        print "0"
        print "#{numStair}  "
        print '#' * (i-1) + ('#' * stairLength) 
        print '#' * 5 
        #print "          #{stairLength}"
        #print "#{x}"
        print "\n"
        x -= 1
        i += 1
        numStair = numStair - 1
        stairLength = stairLength + 2
      end
    end   
  end  
end

def endMessage
  puts "Congratulations ! You won"
end

def performGame
  playerPosition = 0
  staircaseGameWon = false
  loop do
    if staircaseGameWon == false
      playerPosition = diceThrowing(playerPosition)  
      staircaseGame(playerPosition, staircaseGameWon)
    else
      break
    end
  end
end

def perform
  welcome
  performGame
  endMessage
end

perform