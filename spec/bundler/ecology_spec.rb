# frozen_string_literal: true

RSpec.describe Bundler::Ecology do
  it 'has a version number' do
    expect(Bundler::Ecology::VERSION).not_to be nil
  end

  describe '.register' do
    it { expect { described_class.register }.not_to raise_error }
  end

  describe '.config' do
    subject(:config) { described_class.config }

    context 'when config file does not exist' do
      it { is_expected.to eq(disallowed: []) }
    end
  end
end
