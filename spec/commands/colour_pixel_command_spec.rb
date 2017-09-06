require 'spec_helper'
require './lib/commands/colour_pixel_command'

RSpec.describe ColourPixelCommand do
  subject { ColourPixelCommand.new(['2', '2', 'a']) }
  it_behaves_like 'a command'

  describe '#perform' do
    it 'sets the colour value of a single pixel' do
      input  = [['O', 'O', 'O'], ['O', 'O', 'O']]
      output = [['O', 'O', 'O'], ['O', 'A', 'O']]
      expect(subject.perform(input)).to eq output
    end
  end
end
