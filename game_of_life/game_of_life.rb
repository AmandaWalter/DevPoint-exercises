require 'pry'

class GameofLife
  def initialize()
    @rows = 20
    @columns = 20
    @ticks = 20
    init_petri_dish
  end 

  def init_petri_dish
    @petri_dish = Array.new(@rows) { Array.new(@columns) { rand((5)).zero? } }
  end

  def next_gen?(row, col)
    touching_me = (-1..1).map do |r| 
      (-1..1).map do |c|
        cell_row = row + r
        cell_col = col + c
        if outside_bounds(cell_row, cell_col)
          false
        else
          @petri_dish[cell_row][cell_col]
        end
      end
    end
    alive = touching_me[1].delete_at(1)
    neighbors = touching_me.flatten.count(true)
    neighbors == 3 || (neighbors == 2 && alive)
  end

  def outside_bounds(row, col)
    row < 0 || row >= @rows || col < 0 || col >= @columns
  end

  def running_man
    @petri_dish = (0...@rows).map { |row| (0...@columns).map { |col| next_gen?(row, col) } }
  end

  def print_petri_dish
    system('clear')
    puts "*:.,%'*:.,%'*:.,%'*:.,'*:.,%'*:.,%'*:.,%'*"
    puts "The Ruby Game of Life ** Winter edition **"
    @petri_dish.each do |r|
      puts r.map {|c| c ? ' ❄️ ' : ' 🔹 '}.join("")
    end
    puts "*:.,%'*:.,%'*:.,%'*:.,'*:.,%'*:.,%'*:.,%'*"
    sleep 0.4
  end

  def input
    # need to keep user from going outside max/make min too
    puts "How many ticks would you like to see?"
      @ticks = gets.chomp.to_i
    puts "How many rows? MAX 30"
      @rows = gets.chomp.to_i
    puts "How many columns? MAX 100"
      @columns = gets.chomp.to_i
    # seed    
    init_petri_dish
    print_petri_dish
        (1..@ticks).each do
        running_man
        print_petri_dish
          end
  end

  def play
    print_petri_dish
    puts "Would you like a different field? Y/N"
    new_field = gets.chomp.upcase
      unless new_field == "N"
        input
      else
        print_petri_dish
        (1..@ticks).each do
        running_man
        print_petri_dish
          end
        end
    end
end


gol = GameofLife.new()
gol.play

# def validate_size(size_param, max_value)
# if >max
# max_value
# elsif size<min
#   min number
# else
#   size parameter
# end

