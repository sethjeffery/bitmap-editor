require 'spec_helper'
require './lib/commands/horizontal_segment_command'

RSpec.describe HorizontalSegmentCommand do
  subject { HorizontalSegmentCommand.new(['1', '3', '2', 'A']) }
  it_behaves_like 'a command'

  describe '#perform' do
    it 'sets the colour value of a horizontal segment' do
      input  = [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
      output = [['O', 'O', 'O', 'O'], ['A', 'A', 'A', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
      expect(subject.perform(input)).to eq output
    end
  end
end
