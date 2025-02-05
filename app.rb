require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/process_roll") do # Even though the form generates the query string that gets added to the end of the path, this is still the route that we get. Meaning, we don't have to include the query string in the route here.
  @number_of_rolls = params.fetch("dice").to_i
  @number_of_sides = params.fetch("sides").to_i
  
  @dice = []
  @number_of_rolls.times do
    roll = rand(1..@number_of_sides)
    @dice = @dice.push(roll)
  end  


  erb(:results)
end
