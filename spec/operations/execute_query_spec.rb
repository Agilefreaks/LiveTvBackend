# frozen_string_literal: true
require 'spec_helper'
require 'operations/execute_query'

RSpec.describe Operations::ExecuteQuery do
  subject { described_class.new.call(query: Dry::Monads::Maybe::Some::None.instance, variables: Dry::Monads::Maybe::Some::None.instance) }

  context 'when execution fails' do
    before do
      allow(Schema).to receive(:execute).and_raise(GraphQL::ExecutionError.new('Boom! Sachala!'))
    end

    it { is_expected.to be_an_instance_of Dry::Monads::Either::Left }
  end

  context 'when execution passes' do
    before do
      allow(Schema).to receive(:execute).and_return(:ok)
    end

    it { is_expected.to be_an_instance_of Dry::Monads::Either::Right }
  end
end
