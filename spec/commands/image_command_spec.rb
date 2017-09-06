require 'spec_helper'
require './lib/commands/image_command'

RSpec.describe ImageCommand do
  subject { ImageCommand.new(['4', '4']) }
  it_behaves_like 'a command'

  describe '#perform' do
    it 'returns a new bitmap image of the given dimensions' do
      output = [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
      expect(subject.perform).to eq output
    end

    it 'validates x' do
      expect{ ImageCommand.new(['0', '4']).perform }.to raise_error(ArgumentError, "X must be between 1 and 250")
      expect{ ImageCommand.new(['251', '4']).perform }.to raise_error(ArgumentError, "X must be between 1 and 250")
      expect{ ImageCommand.new(['250', '4']).perform }.not_to raise_error
    end

    it 'validates y' do
      expect{ ImageCommand.new(['4', '0']).perform }.to raise_error(ArgumentError, "Y must be between 1 and 250")
      expect{ ImageCommand.new(['4', '251']).perform }.to raise_error(ArgumentError, "Y must be between 1 and 250")
      expect{ ImageCommand.new(['4', '250']).perform }.not_to raise_error
    end
  end
end
