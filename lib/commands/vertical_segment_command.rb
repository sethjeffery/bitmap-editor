require './lib/commands/command'

class VerticalSegmentCommand
  include Command
  shortcut :v

  def perform(input)
    x, y1, y2, colour = args
    (y1.to_i..y2.to_i).each do |y|
      input[y - 1][x.to_i - 1] = colour
    end
    input
  end
end
