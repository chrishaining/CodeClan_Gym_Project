require('sinatra')
require('sinatra/contrib/all')
require_relative('models/booking')
require_relative('models/member')
require_relative('models/fitness_class')
also_reload('./models/*')

# index
get '/' do
  erb(:index)
end

# new
get '/members/new' do
  erb(:new)
end

# # create
post '/members' do
  Member.new(params).save
  redirect to '/members'
end


# # show
get '/members' do
  @members = Member.view_all
  erb(:members)
end


# get '/students/:id' do
#   @student = Student.find(params['id'])
#   erb(:show)
# end
#
# # edit
# get '/students/:id/edit' do
#   @houses = House.all
#   @student = Student.find(params['id'])
#   erb(:edit)
# end
#
# # update
# post '/students/:id' do
#   student = Student.new(params)
#   student.update
#   redirect to "/students/#{params['id']}"
# end
#
# # delete
# post '/students/:id/delete' do
#   student = Student.find(params['id'])
#   student.delete
#   redirect to '/students'
# end
