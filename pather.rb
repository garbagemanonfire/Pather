# Sudo Code

class Pather
  attr_accessor :path, :position, :pattern, :replacer

  def initialize
    @path = []
    @position = {}
    @pattern = /['#']/
    @replacer = '*'
  end

  def runner
    while line = gets
      if(pattern.match(line))
        position_finder(line)
      elsif(position[:index1] && !pattern.match(line))
        position[:index2] ? line_adder(line) : line_draw(line)
      else
        line_adder(line)
      end
    end
    outputer
  end

private

  def position_finder(line)
    line_position = line.scan(@pattern)
    prep = line.split('')
    if !@position[:index1]
      @position[:index1] = prep.index('#')
      line_adder(line)
    else
     @position[:index2] = prep.index('#')
     line_draw(line)
    end
  end

  def line_adder(line)
    line.split("")
    @path << line
  end

  def line_draw(line)
    @position[:index2] ? diff = @position[:index2].to_i - @position[:index1].to_i : diff = 0
    @horizontal_line = Array.new(diff, @replacer).join
    @position[:index2] ? line[@position[:index1], diff] = @horizontal_line : line[@position[:index1]] = @replacer
    line_adder(line)
  end

  def outputer
    puts @path.each {|line| "#{line}" }
  end

end

pathway = Pather.new()
pathway.runner



