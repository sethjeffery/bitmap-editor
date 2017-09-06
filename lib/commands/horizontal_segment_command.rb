require './lib/commands/command'

class HorizontalSegmentCommand
  include Command
  shortcut :h

  def perform(input)
    x1, x2, y, colour = args
    (x1.to_i..x2.to_i).each do |x|
      input[y.to_i - 1][x - 1] = colour
    end
    input
  end
end
