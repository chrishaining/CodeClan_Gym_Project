require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
require_relative('controllers/fitness_classes_controller')
require_relative('controllers/bookings_controller')
require('pry')

get '/' do
  erb( :index )
end

# post '/' do
#   quotes = ["Sweat is fat crying.",
#     "No matter how slow you go, you are still lapping everyone on the couch.",
#     'We are what we repeatedly do.',
#     'Nothing will work unless you do.',
#     'The difference between try and triumph is a little oomph.',
#     'What hurts today makes you stronger tomorrow.']
#     @quotes = quotes.sample
#     erb( :index )
# end
