class Artist

  @@all = []

  attr_reader :name, :years_experience

  def initialize( this_name, these_years_experience )
    @name = this_name
    @years_experience = these_years_experience
    @@all << self
  end

  #   * `Artist.all`
  #     * Returns an `array` of all the artists
  def self.all
    @@all
  end

  #   * `Artist#paintings`
  #     * Returns an `array` all the paintings by an artist
  def paintings
    Painting.all.select{ | painting | painting.artist == self }
  end

  #   * `Artist#galleries`
  #     * Returns an `array` of all the galleries that an artist has paintings in
  def galleries
    paintings.map{ | painting | painting.gallery }.uniq
  end

  #   * `Artist#cities`
  #     * Return an `array` of all cities that an artist has paintings in
  def cities
    paintings.map{ | painting | painting.gallery.city }.uniq
  end

  #   * `Artist.total_experience`
  #     * Returns an `integer` that is the total years of experience of all artists
  def self.total_experience
    self.all.sum{ | artist | artist.years_experience }
  end

  #   * `Artist.most_prolific`
  #     * Returns an `instance` of the artist with the highest amount of paintings per year of experience.
  def self.most_prolific
    paintings_per_artist = Artist.all.map{ | artist | artist.paintings.length }
    years_per_artist = Artist.all.map{ | artist | artist.years_experience }
    paintings_per_year = [ paintings_per_artist, years_per_artist ].transpose.map{ | each | each[ 0 ].to_f / each[ 1 ].to_f }
    Artist.all[ paintings_per_year.each_with_index.max[1] ]
  end

  #   * `Artist#create_painting`
  #     * Given the arguments of `title`, `price` and `gallery`, creates a new painting belonging to that artist
  def create_painting( this_title, this_price, this_gallery )
    Painting.new( this_title, this_price, self, this_gallery )
  end

end
