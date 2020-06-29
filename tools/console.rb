require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1=Startup.new("pathampuzha","kunchachan","d1")
s2=Startup.new("pala","jose","d2")


vc1=VentureCapitalist.new("rukia",10000000000)
vc2=VentureCapitalist.new("deepa",10000000)


fr1=FundingRound.new(s1,vc1,"type1",10000)
fr2=FundingRound.new(s1,vc2,"type2",10000000)
fr3=FundingRound.new(s2,vc2,"type3",10000000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line