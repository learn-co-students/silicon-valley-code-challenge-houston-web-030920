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




end
