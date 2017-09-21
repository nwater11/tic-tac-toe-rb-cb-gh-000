
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

def move(board, index, token = "X")
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

def turn_count(board)
  counter = 0
  board.each do | turn |
    if turn == "X"
      counter += 1
    elsif turn == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"

end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
      return win_combination
    end
  end
  return false
end


def full?(board)
  board.none? do |index|
    if index == " " || index == nil
      return false
    end
  end
end

def draw?(board)
    if !won?(board) && full?(board)
      return true
    end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end


def winner(board)
 if won?(board)
  won?(board).each do |index|
   if board[index] == 'X'
     return 'X'
   elsif board[index] == 'O'
     return 'O'
   end
  end
 end
end
