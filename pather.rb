#!/usr/bin/env ruby
# Class that parses text file, finds positionts of the desired character,
# draws a line between these positions, and outputs a text file
require './pather_app.rb'

input = ARGV.shift
output = ARGV.shift

pathway = Pather.new(input, output)
pathway.runner
