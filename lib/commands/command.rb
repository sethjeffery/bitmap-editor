class MissingCommandError < StandardError; end

# All commands inherit from Command which allows commands to be found by a shortcut character
# and initialized with an array of arguments.
module Command
  attr_reader :args, :shortcut

  class << self
    attr_reader :mappings

    def included(base)
      @mappings ||= {}
      base.extend ClassMethods
    end

    # Finds a command by a list of args, the first argument being the shortcut.
    def from_args(args)
      klass = @mappings[args[0].upcase] || raise(MissingCommandError.new("Unknown shortcut: #{args[0].upcase}"))
      klass.new(args[1..-1])
    end
  end

  module ClassMethods
    # Used by commands to define their shortcut character.
    def shortcut(cmd)
      @shortcut = cmd.to_s.upcase
      Command.mappings ||= {}
      Command.mappings[cmd.to_s.upcase] = self
    end
  end

  def initialize(args=[])
    @args = args
    @shortcut = self.class.instance_variable_get(:@shortcut)
  end
end
