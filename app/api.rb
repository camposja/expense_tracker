require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
    end

    post '/expenses' do 
      JSON.generate('expense_id' => 42)
    end

    get '/expenses/:date' do
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)
      JSON.generate('expense_id' => result.expense_id)
    end
  end
end