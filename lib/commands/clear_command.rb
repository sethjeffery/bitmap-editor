require './lib/commands/command'

# Clears the table, setting all pixels to 'O'.
class ClearCommand
  include Command
  shortcut :c

  def perform(input)
    input.map{|line|
      line.map{|_| 'O'}
    }
  end
end
