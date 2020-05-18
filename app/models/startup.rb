
    class Startup
        @@all= []
        attr_accessor :name
        attr_reader :founder ,  :domain
        def initialize(name, domain, founder)
            @name = name
            @domain = domain
            @founder = founder
            @@all << self
        end 
      
        def pivot(new_domain, name)
            @domain = new_domain
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

