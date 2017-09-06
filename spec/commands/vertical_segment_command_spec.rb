require 'spec_helper'
require './lib/commands/vertical_segment_command'

RSpec.describe VerticalSegmentCommand do
  subject { VerticalSegmentCommand.new(['2', '1', '3', 'A']) }
  it_behaves_like 'a command'

  describe '#perform' do
    it 'sets the colour value of a vertical segment' do
      input  = [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
      output = [['O', 'A', 'O', 'O'], ['O', 'A', 'O', 'O'], ['O', 'A', 'O', 'O'], ['O', 'O', 'O', 'O']]
      expect(subject.perform(input)).to eq output
    end
  end
end
