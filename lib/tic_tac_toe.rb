
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

def move(board, index, token = 'X')
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0, 8)
    return true
  else
    return false
  end
end
