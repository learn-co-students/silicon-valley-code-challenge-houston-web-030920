require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


s1 = Startup.new("Flatiron", "Avi", "Education")
s2 = Startup.new("Facebook", "Mark", "Tech")
vc1 = VentureCapitalist.new("Chris", 10000000)
vc2 = VentureCapitalist.new("Josh", 2000000000)
fr1 = FundingRound.new(s1, vc1, 'angel', 10000)
fr2 = FundingRound.new(s2, vc1, 'series_a', 24000)
fr3 = FundingRound.new(s2, vc2, 'series_b', 5500)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line