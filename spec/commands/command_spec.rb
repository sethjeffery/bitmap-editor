require 'spec_helper'
require './lib/commands/command'

RSpec.describe Command do
  around do |ex|
    # Temporary abstract implementation of Command module
    class CommandTest
      include Command
      shortcut :test
    end
    ex.run
    Object.send(:remove_const, :CommandTest)
  end

  it 'adds commands to mappings' do
    expect(Command.mappings).to include({ 'TEST' => CommandTest })
  end

  describe '.from_args' do
    it 'returns a new command by a shortcut and args list' do
      command = Command.from_args(['Test', 'X', 'Y'])
      expect(command).to be_a CommandTest
      expect(command.args).to eq ['X', 'Y']
    end

    context 'with unknown shortcut' do
      it 'raises a MissingCommandError error' do
        expect{ Command.from_args(['Unknown']) }.to raise_error(MissingCommandError, 'Unknown shortcut: UNKNOWN')
      end
    end
  end
end
