require_relative "pieces"
require "colorize"

class Board

  def initialize(fill_board = true)
    @rows = Array.new(8) { Array.new(8) }
    set_up_pieces
  end

  def []=(position, piece)
    row, col = position
    @rows[row][col] = piece
  end

  def [](position)
    row, col = position
    @rows[row][col]
  end

  def checkmate?(color)
    false
  end

  def move_piece(turn_color, start_pos, end_pos)
    piece = self[start_pos]

    raise "empty spot; must pick a piece" if piece.nil?
    raise "must pick own piece" if piece.color != turn_color
    raise "piece can not move like that" unless piece.moves.include?(end_pos)


    self[start_pos] = nil
    self [end_pos] = piece
    piece.position = end_pos
  end

  def on?(end_pos)
    rowm col - end_pos

    row.between?(0,7) && col.between?(0,7)
  end

  def set_up_pieces
    (0..7).each {|i| Pawn.new(:white, [6,i], self) }
    back_pieces.each_with_index { |piece, i| piece.new(:white, [7,i], self) }

    (0..7).each {|i| Pawn.new(:black, [1,i], self) }
    back_pieces.each_with_index { |piece, i| piece.new(:black, [0,i], self) }
  end


  def back_pieces
    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  end

  def display
    @rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        bg = (i + j).even? ? :white : :light_black
        piece_display = square.nil? ? "   " : square.display
        print piece_display.colorize(background: bg)
      end
      puts
    end
  end
end
