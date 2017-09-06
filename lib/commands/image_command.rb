require './lib/commands/command'

# Creates a brand new image table with the given X Y dimensions.
class ImageCommand
  include Command
  shortcut :i

  def perform(_input=nil)
    x, y = self.args
    raise ArgumentError.new("X must be between 1 and 250") if x.to_i < 1 || x.to_i > 250
    raise ArgumentError.new("Y must be between 1 and 250") if y.to_i < 1 || y.to_i > 250
    lines = []
    y.to_i.times { lines << ['O'] * x.to_i }
    lines
  end
end
