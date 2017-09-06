require 'spec_helper'
require './lib/commands/show_command'

RSpec.describe ShowCommand do
  it_behaves_like 'a command'

  describe '#perform' do
    it 'displays the bitmap in the console' do
      allow(subject).to receive(:puts)
      subject.perform [['A', 'B', 'C'], ['D', 'E', 'F']]
      expect(subject).to have_received(:puts).with('ABC')
      expect(subject).to have_received(:puts).with('DEF')
    end
  end
end
