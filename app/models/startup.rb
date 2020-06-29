class Startup
attr_accessor :name, :domain
attr_reader :founder
@@all=[]
def initialize (name,founder,domain)
    @name=name
    @founder=founder
    @domain=domain
    @@all<<self
end
def pivot(domain,name)
    @domain=domain
    @name=name
end
def sign_contract(vc,type,investment)
    FundingRound.new(self,vc,type,investment)
end
def num_funding_rounds
    FundingRound.all.select {|fr| fr.startup==self}
end
def total_funds
    investments=num_funding_rounds.map {|fr| fr.investment}
    sum=investments.reduce(0) {|sum,x|sum+x}
end
def investors
 investor=num_funding_rounds.map {|fr| fr.venture_capitalist}
  unique=investor.uniq
end
def big_investors
    investors.select {|vc| vc.total_worth>1000000000}
end
def self.find_by_founder(founder)
    self.all.find {|stup| stup.founder==founder}
end
def self.domains
    self.all.map {|stup| stup.domain}
end
def self.all
    @@all
end


















end
