require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    # song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name) 
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #or you can do below, remember pipe is conditional 
    # if self.find_by_name(name) == nil
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end

  end
  
  def self.alphabetical()
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    #similar to csv data example
    song = self.new 
    song.name = (filename.split(" - ") [1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ") [0])
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ") [1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ") [0])
    @@all << song
    song
  end

  def self.destroy_all()
    # @@all.clear
    self.all.clear
  end

end



