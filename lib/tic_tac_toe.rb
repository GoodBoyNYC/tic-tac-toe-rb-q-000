#rspec spec/01_tic_tac_toe_spec.rb
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def play(board)
  until won?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(board, input)
    turn(board)
  end
  move(board, input, current_player(board))
  display_board(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X" }
      return combo
    elsif combo.all? {|index| board[index] == "O"}
      return combo
    end
  end
  false
end

def full?(board)
  if board.detect {|spot| spot == " "}
    false
  else
    true
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  fullBool= full?(board)
  wonBool= won?(board)
  drawBool= draw?(board)
  if drawBool || wonBool
    true
  elsif
    false
  end
end


def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def turn_count(board)
  count=0
  board.each do |cell|
      if (cell=="X" || cell=="O")
        count+=1
      end
  end
  return count
end

def current_player(board)
  if(turn_count(board) % 2==0)
    return "X"
  else
    return "O"
  end
end