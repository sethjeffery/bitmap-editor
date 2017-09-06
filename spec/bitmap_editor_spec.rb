require 'spec_helper'
require './lib/bitmap_editor'

RSpec.describe BitmapEditor do
  describe '#run' do
    it 'performs commands from a file' do
      allow(subject).to receive(:perform)
      allow(subject).to receive(:commands_from).and_return(:commands)
      subject.run("file")
      expect(subject).to have_received(:perform).with(:commands)
    end

    context 'with error message' do
      it 'outputs the error' do
        allow(subject).to receive(:puts)
        allow(subject).to receive(:commands_from).and_raise(InvalidInputError.new('Error message!'))
        subject.run("file")
        expect(subject).to have_received(:puts).with('Error message!')
      end
    end
  end

  describe '#commands_from' do
    context 'with existing file' do
      let(:commands) { ['one', 'two ', ''] }

      before do
        allow(Command).to receive(:from_args)
        allow(File).to receive(:open).and_return(commands)
        subject.commands_from('./examples/show.txt')
      end

      it 'grabs commands from a file' do
        expect(File).to have_received(:open).with('./examples/show.txt')
      end

      it 'grabs a command for each line' do
        expect(Command).to have_received(:from_args).twice
      end
    end

    context 'with non-existing file' do
      it 'raises an error' do
        expect{ subject.commands_from('./examples/missing-file.txt') }.to raise_error(InvalidInputError, "Please provide correct file")
      end
    end
  end

  describe '#perform' do
    it 'performs each given command in chain' do
      cmd_show = double(:command, perform: 'show output')
      cmd_image = double(:command)
      allow(cmd_image).to receive(:perform).with('show output').and_return('final output')
      expect(subject.perform([cmd_show, cmd_image])).to eq 'final output'
    end
  end
end
