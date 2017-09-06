require './lib/commands/command'

# Displays the image table to the console.
class ShowCommand
  include Command
  shortcut :s

  def perform(input)
    input.each do |line|
      puts line.join
    end
    input
  end
end
