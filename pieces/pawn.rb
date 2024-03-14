class Pawn < Piece
  def picture
    "\u265F"
  end

  def moves
    forward_moves + diagonal_attacks
  end

  def forward_moves
    moves =[]

    one_step = [row + direction, col]
    two_steps = [row + (direction * 2), col]

    moves << one_step if board.on?(one_step) && board[one_step].nil?
    moves << two_steps if board[one_step].nil? && board[two_step].nil? && unmoved

    moves
  end

  def diagonal_attacks
    moves = []

    diagonal_left = [row + direction, col - 1]
    diagonal_right = [row + direction, col + 1]

    moves << diagonal_left if board.on?(diagonal_left) && board[diagonal_left]&.color != color
    moves << diagonal_right if board.on?(diagonal_right) && board[diagonal_right]&.color != color

    moves
  end

  def unmoved
    color == :white && row == 6 || color == :black && row == 1
  end

  def direction
    color == :white? ? -1 : 1
  end
end