require 'pry'

class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    @@domain =[]

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domain << domain
    end

    def self.domain
        @@domain
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        f = []
        Startup.all.each do |startup|
            if startup.founder == founder_name
                f << startup
            end
        end
        f[0]
    end

    def sign_contract(v_c, type, investment)
        new_fund = FundingRound.new(type, self, v_c, investment)
        new_fund
    end


    def num_funding_rounds
        counter = 0
        FundingRound.all.each do |f|
            if f.startup == self
                counter += 1
            end
        end
        counter
    end

    def total_funds
        total = 0
        FundingRound.all.each do |f|
            if f.startup == self
                total += f.investment
            end
        end
        total
    end

    def investors
        i = []
        FundingRound.all.each do |f|
            if f.startup == self
                i << f.venture_capitalist
            end
        end
        i.uniq
    end

    def big_investors
        i = []
        FundingRound.all.each do |f|
            if f.startup == self
                if f.venture_capitalist.class.tres_commas_club.include?(f.venture_capitalist)
                    binding.pry
                    i << f.venture_capitalist
                end
            end
        end
        i.uniq
    end

end
