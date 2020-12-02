class Genre
    extend Concerns::Findable 
    
    attr_accessor :name 

    @@all = []
    
    def initialize(name)
        @name = name  
        @songs = []
    end 

    def save 
        @@all << self
    end 


    def self.all 
        @@all 
    end 

    def self.destroy_all 
        @@all.clear
    end 

    def self.create(name)
        created_genre = self.new(name)
        created_genre.save 
        created_genre
    end 

    def songs 
        @songs
    end

    def artists
        self.songs.map {|song| song.artist}.uniq
    end 
end
