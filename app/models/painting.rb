class Painting

  @@all = []

  attr_reader :title, :price, :artist
  attr_accessor :gallery

  def initialize( this_title, this_price, this_artist, this_gallery )
    @title = this_title
    @price = this_price
    @artist = this_artist
    @gallery = this_gallery
    @@all << self
  end

  # * `Painting.all`
  # * Returns an `array` of all the paintings
  def self.all
    @@all
  end

  # * `Painting.total_price`
  # * Returns an `integer` that is the total price of all paintings
  def self.total_price
    self.all.sum{ | painting | painting.price }
  end

end
