class BracketMap
  attr_accessor :map

  def initialize
    @map = {}
    return self
  end

  def open_bracket(line)
    add_bracket(line, '{')
  end

  def close_bracket(line)
    add_bracket(line, '}')
  end

  def add_bracket(line, bracket)
    if @map[line].nil?
      @map[line] = bracket
    else
      @map[line] << bracket
    end
  end

  def visualize
    tab_level = 0
    @map.each do |key, value|
      print "#{key}:\t| "
      buf = ''
      current_tab_level = 0
      value.each_char do |char|
        case char
        when '{'
          current_tab_level += 1
        when '}'
          current_tab_level -= 1
        end
        buf << char
      end
      if current_tab_level > 0
        puts "  "*tab_level + buf
        tab_level += current_tab_level
      else
        tab_level += current_tab_level
        puts "  "*tab_level + buf
      end
    end
  end
end

bmap = BracketMap.new

line_number = 0
while line = gets
  line_number += 1
  line.each_char do |char|
    case char
      when "{"
        bmap.open_bracket(line_number)
      when "}"
        bmap.close_bracket(line_number)
    end
  end
end

bmap.visualize
