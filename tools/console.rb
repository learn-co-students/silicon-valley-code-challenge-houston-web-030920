require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s_up1 = Startup.new("S Up1", "isaac", "Dom 1")
s_up2 = Startup.new("S Up2", "isaac", "Dom 2")
v_cap1 = VentureCapitalist.new("Ven 1", 100000001)
v_cap2 = VentureCapitalist.new("Ven 2", 500)
f_round = FundingRound.new("seed",s_up1, v_cap1, 800)
# f_round4 = FundingRound.new("seed",s_up2, v_cap1, 800)
# f_round5 = FundingRound.new("seed",s_up1, v_cap1, 800)
f_round2 = FundingRound.new("seed 2",s_up2, v_cap2, 600)
f_round3 = FundingRound.new("seed 3",s_up2, v_cap2, 700)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line