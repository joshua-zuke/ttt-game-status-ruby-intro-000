# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# MY VERSION
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

# THEIR VERSION

# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     board[combo[0]] == board[combo[1]] &&   This line and the line below ensure that all three indexes (0,1,2) are equal to one another.
#     board[combo[1]] == board[combo[2]] &&
#     position_taken?(board, combo[0])        This line makes sure that they aren't equal in being blank " ".
#   end
# end

# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


# MY VERSION

def full?(board)
  board.none?{|position| position == " "}
end

# THEIR VERSION

# def full?(board)
#   board.all?{|token| token == "X" || token == "O"}   Basically the same as mine but the inverse.
# end

# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# MY VERSION

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  elsif won?(board) == true     # I don't think this is doing anything, that method will never return "True".
    false
  elsif won?(board) == false && full?(board) == false
    false
  end
end

# THEIR VERSION

# def draw?(board)
#  full?(board) && !won?(board)     So much cleaner. If the board is full and isn't won, it's a draw!
# end


# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# MY VERSION

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

# THEIR VERSION

# def over?(board)
#   won?(board) || full?(board)     If it's a draw, it's inherently full, so these are the only two needed conditions.
# end                               Also, note that it doesn't need the if/else at all. I need to get out of that habit.


# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# MY VERSION

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
  end
end
nil
end

# THEIR VERSION

# def winner(board)
#  if winning_combo = won?(board)     Not sure I understand this one.
#    board[winning_combo.first]       Don't know what .first does but it must return the value of X or O itself.
#  end
# end
