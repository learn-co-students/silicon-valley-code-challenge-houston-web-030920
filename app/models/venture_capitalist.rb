require 'pry'

class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        tcc = []
        self.all.each do |cap|
            if cap.total_worth > 1000000
                tcc << cap
            end
        end
        tcc
    end

    def offer_contract(startup, type, investment)
        new_fund = FundingRound.new(type, startup, self, investment)
        new_fund
    end

    def num_funding_rounds
        counter = 0
        FundingRound.all.each do |f|
            if f.venture_capitalist == self
                counter += 1
            end
        end
        counter
    end

    def portfolio
        i = []
        FundingRound.all.each do |f|
            if f.venture_capitalist == self
                i << f.startup
            end
        end
        i.uniq
    end

    def biggest_investment
        b_i = self.funded_rounds[0]
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                if fr.investment > b_i.investment
                    b_i = fr
                end
            end
        end
        b_i
    end

    def funded_rounds
        x = []
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                x << fr
            end
        end
        x
    end

    # def investment_count
    #     funded_rounds.length
    # end

    # def self.most_investment
    #     b_i = FundingRound.all[0]
    #     FundingRound.all.each do |fr|
    #         if fr.venture_capitalist.investment_count > b_i.venture_capitalist.investment_count
    #             b_i = fr
    #         end
    #     end
    #     b_i.venture_capitalist.name
    # end


    def invested(domain)
        total = 0
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                if fr.startup.domain == domain
                    total += fr.investment
                end
            end
        end
        total
    end


end
