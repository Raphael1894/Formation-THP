
def askLayers
  puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
  print ">"
  layers = gets.chomp
  return layers
end


def BuildPyramid(layers)
  i = 1
  x = layers.to_i + 1 # Set number of rows
  1.upto(x) do
    print ' ' * x
    print '#' * (i-1)
    print "\n"
    x -= 1
    i += 1
  end

end




def perform
  layers = askLayers
  BuildPyramid(layers)
end

perform