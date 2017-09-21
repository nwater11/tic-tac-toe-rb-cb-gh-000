
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2] }  "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5] }  "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8] }  "
end

def input_to_index(input)
  user_input = input.to_i - 1
  return user_input
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0, 8) && !(position_taken?(board, index))
    return true
  else
    return false
  end
end

def turn(board)
 puts "Please enter 1-9:"
 user_input = gets
 index = input_to_index(user_input)
 fact = valid_move?(board, index)
 if fact == true
  move(board, index)
  return display_board(board)
 else
  turn(board)
 end
end
