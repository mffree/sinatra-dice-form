require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/process_roll") do
  @number_of_rolls = params.fetch("dice").to_i
  @number_of_sides = params.fetch("sides").to_i
  
  @dice = []
  @number_of_rolls.times do
    roll = rand(1..@number_of_sides)
    @dice = @dice.push(roll)
  end  


  erb(:results)
end
