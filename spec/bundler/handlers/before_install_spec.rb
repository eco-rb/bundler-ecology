# frozen_string_literal: true

require 'bundler/ecology/handlers/before_install'

RSpec.describe Bundler::Ecology::Handlers::BeforeInstall do
  subject(:handler) { described_class.new(config) }

  let(:config) do
    { disallowed: [name: 'activesupport'] }
  end

  describe '#call(dependency)' do
    subject(:call) { handler.call(dependency) }

    context 'when dependency is allowed' do
      let(:dependency) { double(:dependency, name: 'sequel') }

      it { expect(call).to be nil }
    end

    context 'when dependency is not allowed' do
      let(:dependency) { double(:dependency, name: 'activesupport') }

      it { expect { call }.to raise_error(Bundler::PluginError) }
    end
  end
end
