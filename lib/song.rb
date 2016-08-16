class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # def self.create
  #   @@all << self.new
  # end

  # def self.create
  #   song = self.new
  #   self.all << song.save
  #   song
  # end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    song_array = file.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].gsub(".mp3", "")
    
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  # def self.create_from_filename(file)
  #   song = self.new_from_filename(file)
  #   song.save
  #   song
  # end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    self.all.clear
  end



end
