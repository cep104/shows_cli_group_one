class Show 
    attr_accessor :name, :schedule, :genres, :network
    @@all = []
    def initialize(show_hash)
        show_hash.each do |key, value| 
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_show(show_info)
        Show.all.find do |show| 
            show.name = show_info
        end
    end
end