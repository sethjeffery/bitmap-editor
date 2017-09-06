RSpec.shared_examples "a command" do
  it 'has args' do
    expect(subject).to respond_to :args
  end

  it 'can set a shortcut' do
    expect(described_class).to respond_to :shortcut
  end

  it 'has a shortcut defined' do
    expect(subject.shortcut.to_s).not_to be_empty
  end
end
