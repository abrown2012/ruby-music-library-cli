class Artist 
    extend Concerns::Findable 

    attr_accessor :name, :songs

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
        artist = Artist.new(name)
        self.all << artist  
        artist 
    end 

    def add_song(song)
        if song.artist == self 
        else song.artist = self 
        end 
        if @songs.include? song 
        else @songs << song 
        end 
    end 

    def songs 
        @songs
    end 

    def genres 
        songs.map {|song| song.genre}.uniq
    end 

end 
