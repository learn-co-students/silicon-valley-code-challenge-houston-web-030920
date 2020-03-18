require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

flatiron = Startup.new("Flatiron School", "Code Bootcamp", "Avi")
mark_cuban = VentureCapitalist.new("Mark Cuban", 2000000000)
angelo = VentureCapitalist.new("Angelo", 5)
funding_1 = FundingRound.new(flatiron, mark_cuban, "Seed", 23456)

binding.pry