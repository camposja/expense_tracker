require_relative '../../app/api'
require 'rack/test'
require 'json'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API Jose edition' do
  include Rack::Test::Methods

    def app 
      ExpenseTracker::API.new
    end

    it 'records submitted expenses' do
      coffee = {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }

      post '/expense', JSON.generate(coffee)
    end
  end
end