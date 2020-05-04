class VentureCapitalist
    @@all = []
    attr_accessor :name, :total_worth
    
        def initialize(options)
            @name = options[:name]
            @total_worth = options[:total_worth]
            @@all.push(self)
        end
    
        def self.all
            @@all 
        end
    
        def self.tres_commas_club 
            rich = []
            VentureCapitalist.all.each do |millionaire|
                if millionaire.total_worth >= 1000000000
                    rich << millionaire
                end
            end
            rich
        end
    
        def offer_contract(startup_object,type,amount_invested)
            options = {startup:startup_object,venture_startup:self,type:type,
            investment:amount_invested}
            FundingRound.new(options)
    
        end
    
        def funding_rounds
            funding_rounds =[]
            FundingRound.all.each do |rounds|
               if rounds.venture_capitalist == self
                funding_rounds.push(rounds.venture_capitalist)
               end
            end
            return funding_rounds #array of funding rounds per VC
        end 
    
    
        def portfolio
            startups = []
            FundingRound.all.each do |round|
                if round.venture_capitalist == self 
                    startups.push(round.startup)
                end
            end
            startups.uniq       
                        
        end  
    
    
        def biggest_investment
            largest_fr = 0
            FundingRound.all.each do |rounds|           
                if rounds.investment > largest_fr && rounds.venture_capitalist == self
                    largest_fr = rounds.investment 
                end
            end
            return largest_fr
    
        end
        #         - `VentureCapitalist#invested`
    #   - given a **domain string**, returns the total amount invested in that domain
                 
        def invested(domain_string)
            investments = 0
            FundingRound.all.each do |round|        #for all Funding rounds, use  instance[0] of round , use instane[1]
               if round.venture_capitalist == self && round.startup.domain == domain_string
                investments += round.investment
               end
            end
            return investments
    
        end
    
        
    
    
    
    
    end