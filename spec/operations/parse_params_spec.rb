# frozen_string_literal: true
require 'spec_helper'
require 'operations/parse_params'
require 'roda'

RSpec.describe Operations::ParseParams do
  subject { described_class.new.call(request) }

  let(:query) { nil }
  let(:variables) { nil }
  let(:body) { nil }
  let(:request) { instance_double(Roda::RodaRequest) }

  before do
    allow(request).to receive(:[]).with('query').and_return(query)
    allow(request).to receive(:[]).with('variables').and_return(variables)
    allow(request).to receive(:body).and_return(StringIO.new(body.to_s))
  end

  context 'when request has query param' do
    let(:query) { 'some query' }

    it { is_expected.to be_a_kind_of(Dry::Monads::Either::Right) }

    its(:value) { is_expected.to eq(query: 'some query', variables: Dry::Monads::Maybe::Some::None.instance) }

    context 'and variables param' do
      let(:variables) { 'some variables' }

      its(:value) { is_expected.to eq(query: 'some query', variables: Dry::Monads::Some('some variables')) }
    end
  end

  context 'when request has body params' do
    let(:body) { { 'query' => 'body query', 'variables' => 'body variables' }.to_json }

    it { is_expected.to be_a_kind_of(Dry::Monads::Either::Right) }

    its(:value) { is_expected.to eq(query: 'body query', variables: Dry::Monads::Some('body variables')) }
  end
end
