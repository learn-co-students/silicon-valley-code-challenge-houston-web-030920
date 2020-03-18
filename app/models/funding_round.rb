class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist
    @@all = []
​
    def initialize(type, startup, venture_capitalist, investment = nil)
        @type = type
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment.to_f
        @@all << self
    end
​
    def self.all
        @@all
    end
​
    
    
end