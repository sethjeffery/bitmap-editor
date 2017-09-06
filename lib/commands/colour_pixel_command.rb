require './lib/commands/command'

# Sets the colour of a single pixel at the given X Y coordinates.
class ColourPixelCommand
  include Command
  shortcut :l

  def perform(input)
    x, y, colour = args
    input[y.to_i - 1][x.to_i - 1] = colour.upcase
    input
  end
end
