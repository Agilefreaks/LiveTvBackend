# frozen_string_literal: true
require 'livetv/transactions'

Livetv::Transactions.define do |t|
  t.define 'transactions.execute_query' do
    step :parse_params, with: 'operations.parse_params'
    step :execute_query, with: 'operations.execute_query'
  end
end
