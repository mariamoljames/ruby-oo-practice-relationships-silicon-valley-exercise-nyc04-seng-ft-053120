class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all=[]
    def initialize(name,total_worth)
        @name=name
        @total_worth=total_worth
        @@all<<self
    end
    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end
    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist==self}
    end
    def portfolio
        startups=funding_rounds.map {|fr| fr.startup}
        unique=startups.uniq
    end
    def biggest_investment
        funding_rounds.max_by do |fr|
            fr.investment
        end
    end
    def invested(domain)
        startup=portfolio.select {|stup| stup.domain==domain}
        investment=0
        funding_rounds.each do |x|
            startup.each do |y|
                if x.startup==y
                    investment+=x.investment
                end
            end
        end
        investment
    end
    def self.all
        @@all
    end
    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth>1000000000}
    end

end
