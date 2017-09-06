require './lib/commands'

class InvalidInputError < StandardError; end

class BitmapEditor
  def run(file)
    perform commands_from file
  rescue InvalidInputError => e
    return puts e.message
  end

  def commands_from(file)
    raise InvalidInputError.new("Please provide correct file") if file.nil? || !File.exist?(file)

    File.open(file).reject{|line| line.empty?}.map do |line|
      Command.from_args(line.chomp.split(' '))
    end
  end

  def perform(commands)
    commands.inject([]) { |memo, command|
      command.perform(memo)
    }
  end
end
