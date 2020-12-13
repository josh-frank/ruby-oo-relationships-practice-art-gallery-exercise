require_relative '../config/environment.rb'

gagosian = Gallery.new( "Gagosian Gallery", "Los Angeles" )
zwirner = Gallery.new( "David Zwirner Gallery", "New York" )
mertens = Gallery.new( "Galerie Martin Mertens", "Berlin" )

warhol = Artist.new( "Andy Warhol", 20 )
soup_cans = Painting.new( "Campbell's Soup Cans", 11776000, warhol, gagosian )
mao = Painting.new( "Mao", 47514000, warhol, zwirner )
warhol.create_painting( "Double Elvis", 43762500, mertens )

picasso = Artist.new( "Pablo Picasso", 25 )
gommeuse = Painting.new( "La gommeuse", 67450000, picasso, gagosian )
picasso.create_painting( "Femme au chien", 54936000, zwirner )

richter = Artist.new( "Gerhard Richter", 30 )
blau = Painting.new( "Blau", 28725000, richter, mertens )
richter.create_painting( "Domplatz, Mailand", 37125000, gagosian )

van_gogh = Artist.new( "Vincent van Gogh", 35 )
paysage = Painting.new( "Paysage sous un ciel mouvementé", 54010000, van_gogh, zwirner )
van_gogh.create_painting( "L'allée des Alyscamps", 66330000, mertens )

binding.pry

puts "Bob Ross rules."
