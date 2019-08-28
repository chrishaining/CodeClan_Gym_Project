require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/fitness_class.rb')
also_reload('../models/*')

# index
get '/fitness_classes' do
  # @fitness_classes = FitnessClass.view_all()
  @upcoming_fitness_classes = FitnessClass.view_upcoming_classes
  @archived_fitness_classes = FitnessClass.view_archived_classes
  erb( :"fitness_classes/index")
end


# new
get '/fitness_classes/new' do
  erb( :"fitness_classes/new")
end

# # create
post '/fitness_classes' do
  @fitness_class = FitnessClass.new(params).save
  erb( :"fitness_classes/create")
end

# show all classes - not needed, as the index does this
get '/fitness_classes' do
  @fitness_classes = FitnessClass.view_all
  erb(:"fitness_classes")
end

#show a specific class, found by ID
get '/fitness_classes/:id' do
  @fitness_class = FitnessClass.view_class_by_id(params['id'])
  @attendees = @fitness_class.attendees
  erb( :"fitness_classes/show")
end

# edit
get '/fitness_classes/:id/edit' do
  @fitness_class = FitnessClass.view_class_by_id(params['id'])
  erb(:"fitness_classes/edit")
end

# update
post '/fitness_classes/:id' do
  fitness_class = FitnessClass.new(params)
  fitness_class.update
  erb( :"fitness_classes/update")
end

# delete
post '/fitness_classes/:id/delete' do
  FitnessClass.delete_fitness_class_by_id(params['id'])
  erb( :"fitness_classes/delete")
end
