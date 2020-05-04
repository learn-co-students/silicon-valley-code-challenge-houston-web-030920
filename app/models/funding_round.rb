class FundingRound
    @@all = []
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist 

    def initialize(options)
        @startup = options[:startup]
        @venture_capitalist = options[:venture_capitalist]
        @type = options[:type]
        @investment = options[:investment]
        @@all.push(self)
    end

    def self.all
        @@all 
    end

