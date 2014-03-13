#!/usr/bin/env ruby
# Class that parses text file, finds positionts of the desired character,
# draws a line between these positions, and outputs a text file
class Pather
  attr_accessor :position, :pattern, :input, :output

  def initialize(input, output)
    @path = [] #
    @position = {}
    @pattern = /['#']/
    @character = '#' #
    @replacer = '*' #
    @input_file = File.new(input, 'r')
    @output_file = File.new(output, 'w')
  end

  def runner
    @input_file.each do |line|
      if pattern.match(line)
        position_finder(line)
      elsif position[:index1] && !pattern.match(line)
        position[:index2] ? line_adder(line) : line_draw(line)
      else
        line_adder(line)
      end
    end
    outputer
  end

  private

  def position_finder(line)
    prep = line.split('')
    if !@position[:index1]
      @position[:index1] = prep.index(@character)
      line_adder(line)
    else
      @position[:index2] = prep.index(@character)
      line_draw(line)
    end
  end

  def line_adder(line)
    line.split('')
    @path << line
  end

  def line_draw(line)
    @position[:index2] ? line_draw_horizontal(line) : line_draw_vertical(line)
  end

  def line_draw_horizontal(line)
    diff = @position[:index2].to_i - @position[:index1].to_i
    horizontal_line = Array.new(diff, @replacer).join
    line[@position[:index1], diff] = horizontal_line
    line_adder(line)
  end

  def line_draw_vertical(line)
    line[@position[:index1]] = @replacer
    line_adder(line)
  end

  def outputer
    puts @path.each { |line| @output_file.puts"#{line}" }
  end
end

input = ARGV.shift
output = ARGV.shift

pathway = Pather.new(input, output)
pathway.runner
