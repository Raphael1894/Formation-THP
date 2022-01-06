def askLayers
  loop do
    puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
    print ">"
    askLayers = gets.chomp.to_i
    if askLayers.odd? && askLayers >= 1 && askLayers <=25
      layers = askLayers
      return layers
      break
    else puts "Veuillez entrer un nombre impair compris entre 1 et 25"
    end
end
end

def fullPyramid(layers)
  layers = layers.to_i
    pyramid = ""
    layers.times do |i|
      space_count = (i - layers / 2).abs
      pound_count = layers - space_count * 2
      pyramid << [' ' * space_count, '#' * pound_count].join + "\n"
    end
  return pyramid
end

def perform
  
  layers = askLayers
  fullPyramid(layers)
  puts fullPyramid(layers)
end

perform





