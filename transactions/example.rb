# frozen_string_literal: true
require 'livetv/transactions'

Livetv::Transactions.define do |t|
  # Define your dry-transaction objects here:
  #
  # t.define "transactions.users.sign_up" do
  #   step :persist, with: "users.operations.sign_up"
  #   # other steps here
  # end
end
