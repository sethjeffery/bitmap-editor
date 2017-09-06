require 'spec_helper'
require './lib/commands/clear_command'

RSpec.describe ClearCommand do
  it_behaves_like 'a command'

  describe '#perform' do
    it 'clears the bitmap data' do
      input  = [['A', 'B', 'C'], ['D', 'E', 'F']]
      output = [['O', 'O', 'O'], ['O', 'O', 'O']]
      expect(subject.perform(input)).to eq output
    end
  end
end
