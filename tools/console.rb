require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



star1 = Startup.new({name:"Rafa's pizzas",founder:"JPMorgan",domain:"Rafaspizzas.com"})
star2 = Startup.new({name:"Alma's beers",founder:"Wellfargo",domain:"Almasbeers.com"})


binding.pry
0 #leave this here to ensure binding.pry isn't the last line