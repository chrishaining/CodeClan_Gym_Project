require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/fitness_class.rb')
also_reload('../models/*')

# index
get '/fitness_classes/index' do
  @fitness_classes = FitnessClass.view_all()
  erb( :"fitness_classes/index")
end

# new
get '/fitness_classes/new' do
  erb( :"fitness_classes/new")
end

# # create - this works, but the system allows the user to enter blank fields, which I want to fix.
post '/fitness_classes' do
  @fitness_class = FitnessClass.new(params).save
  # @fitness_class.datetime = '#{params[:date]} + #{params[:time]}' 
  erb( :"fitness_classes/create")
end
#
# # show all classes - not needed, as the index does this
# get '/fitness_classes' do
#   @fitness_classes = FitnessClass.view_all
#   erb(:"fitness_classes")
# end

#show a specific class, found by ID - this isn't working. Should I be using a FitnessClass.new here?
get '/fitness_classes/:id' do
  @fitness_class = FitnessClass.view_class_by_id(params['id'])
  @attendees = @fitness_class.attendees
  erb( :"fitness_classes/show")
end

# # edit
get '/fitness_classes/:id/edit' do
  @fitness_class = FitnessClass.view_class_by_id(params['id'])
  erb(:"fitness_classes/edit")
end
# #
# # update
post '/fitness_classes/:id' do
  fitness_class = FitnessClass.new(params)
  fitness_class.update
  erb( :"fitness_classes/update")
  # redirect to "/fitness_classes/#{params['id']}"
end
#
# delete
post '/fitness_classes/:id/delete' do
  FitnessClass.delete_fitness_class_by_id(params['id'])
  redirect to '/fitness_classes/index'
end
