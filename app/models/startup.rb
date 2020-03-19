class Startup

    attr_accessor :name, :domain
    attr_reader :founder
    
    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def pivot(new_name, new_domain)
        # s1.pivot("new domain", "new name")
        @name = new_name
        @domain = new_domain
    end
    
    def self.find_by_founder(founder)
        Startup.all.select do |startup|
            startup.founder == founder
        end
    end
    
    def self.domains
        domains = []
        Startup.all.each do |startup|
            domains.push(startup.domain)
        end
        domains.uniq
    end
    
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end
    
    def num_funding_rounds
        funding = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        funding.count
    end
    
    def total_funds
        total = 0
        funds = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        investments =  funds.map do |fund|
            total += fund.investment
        end
        total
    end
    
    def investors
        funds = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        vc = funds.map do |fund|
            fund.venture_capitalist
        end
        vc.uniq
    end
    
    def big_investors
        VentureCapitalist.tres_commas_club && self.investors
    end

end