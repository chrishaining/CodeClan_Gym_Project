#to put into the models, to allow the user to view upcoming classes.


#SQL search
SELECT * FROM fitness_classes
WHERE date >= CURDATE
AND date_and_time >= NOW


#in the fitness_class.rb
attr_accessor :date_and_time

@date_and_time = options['date_and_time'].to_datetime

def show_upcoming_fitness_classes()
  sql = "
  SELECT * from fitness_classes
  WHERE date_and_time >= NOW
  "
  upcoming_classes = SqlRunner.run(sql)
  result = upcoming_classes.map { |fitness_class| FitnessClass.new(fitness_class)}
  return result
end

#for views/fitness_classes/show.erb
<h2><%= @fitness_class.name %></h2>
<p>Class ID: <%= @fitness_class.id %></p>
<p>Attendees: <%= @fitness_class.attendees %></p>
<a href="/fitness_classes/<%= @fitness_class.id %>/edit">Edit Class Details</a>
<form action="/fitness_classes/<%= @fitness_class.id %>/delete" method="POST"><input type="submit" value="Delete"></form>
