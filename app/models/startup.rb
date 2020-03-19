class Startup
    
    @@all =[]

    attr_accessor :founder
    attr_reader :domain, :name

    def initialize(options)
        @name = options[:name]
        @founder = options[:founder]
        @domain = options[:domain]
        @@all.push(self)
    end

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find do |startup|
            if startup.founder == founder_name
                return startup
            end
        end
    end

    def self.domains
        domains = []
        Startup.all.each do |startup|
            domains.push(startup.domain)
        end
        return domains
    end

    def sign_contract(venture_capitalist, type, investment)
        #creates a new funding round
        options = ({startup: self, venture_capitalist: venture_capitalist, type: type, investment: investment})
            FundingRound.new(options)
    end

    def num_funding_rounds
        funding_rounds = 0 
        FundingRound.all.each do |round|
            if round.startup == self
                funding_rounds += 1 
            end
        end
        funding_rounds

    end

    def total_funds
        total_funds = 0
        FundingRound.all.each do|round|
            if round.startup == self
                total_funds += round.investment
            end
        end
        total_funds


    end
            #Startup.investors / Rafa'sPizzas.investors
    def investors               #Rafa'sPizza        #AlmasBeer
        capitalists = []        #empty array for answer
        FundingRound.all.each do |funding_round|            ##iterates through fund1...fund2...
            if funding_round.startup == self        #if fund1.startup == this startup we are using this method on
                capitalists.push(funding_round.venture_capitalist)  #add fun1.venture_capitalst (an object) to our array
            end
        end
       return capitalists.uniq  #return the array
    end

    def big_investors
        big_capitalists = []    #Venture_capitalist.tres_commas_club << Class Method
            FundingRound.all.each do |millionaire|              #Rockafeller
                if millionaire.startup == self && VentureCapitalist.tres_commas_club.include?(millionaire.venture_capitalist)
                    big_capitalists.push(millionaire.venture_capitalist)
                end
            end
            return big_capitalists
    end


end