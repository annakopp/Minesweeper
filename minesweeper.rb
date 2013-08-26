load 'square.rb'

class Minesweeper

  attr_accessor :size, :bomb_num, :board
  POSSIBLE_NEIGHBORS = [[0, 1], [0, -1],
                        [1, 0], [-1, 0],
                        [1, 1], [-1, -1],
                        [1, -1],[-1,1]]

  def initialize(size, bomb_num)
    @size = size
    @bomb_num = bomb_num
    @board = []
    @flag_num = 0
    @pow = false
  end

  def build_board
    @size.times do |x|
      @board[x] = []

      @size.times do |y|
        square = Square.new(x, y, false)
        @board[x][y] = square
      end
    end
  end

  def fill_bombs
    placed_bombs = 0
    coordinates = (0...@size).to_a

    until placed_bombs == @bomb_num
      x = coordinates.sample
      y = coordinates.sample
      unless @board[x][y].bomb

       @board[x][y].bomb = true
       placed_bombs += 1
      end
    end
  end

  def print_board
    @board.each do |x|
      x.each { |y| print y.display + " " }
      puts ""
    end
  end

  def run
    build_board
    fill_bombs
    print_board

    until @pow
      user_input
      print_board
    end

    check_victory #will

  end

  def user_input
    p "Do something"
    input = gets.chomp
    case input[0]
    when "R"
      reveal(input[1].to_i, input[2].to_i)
    when "F"
      flag(input[1].to_i, input[2].to_i)
    end
  end

  def flag(x,y)
    if @board[x][y].display == "F"
      @flag_num -= 1
      @board[x][y].display = "*"
    else
      @flag_num += 1
      @board[x][y].display = "F"
    end
  end

  def reveal(x,y)
    if @board[x][y].bomb
      @board[x][y].display = "X"
      @pow = true
    else
      neighbors = []



    end
  end

  def neighbors(x, y)
    neighbors = []
    POSSIBLE_NEIGHBORS.each do |poss|
      square = board[poss[0] + x][poss[1] + y]
      neighbors << square unless square.nil?
    end

  end

end

ms = Minesweeper.new(9, 10)

