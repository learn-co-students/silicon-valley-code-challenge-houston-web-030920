class Startup
    @@all= []
    attr_accessor :name, :domain
    attr_reader :founder 

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder
        @@all << self
    end 

    def founder()
        @founder
    end

    def domain()
        @domain
    end 

    def pivot(domain, name)
        @domain = domain
        @name = name
    end 

    def self.all
        @@all
    end

    def self.domains
        all_domains = []
        self.all.each do |startup|
            all_domains << startup.domain
        end
        all_domains
    end

end
