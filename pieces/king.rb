class King < Piece
  include Steppable

   def picture
    "\u2654"
  end

  def moves

  end

  def movements
    [
      [-1,-1],
      [-1,-0],
      [-1,-1],
      [0,-1],
      [0,-1],
      [1,-1],
      [1,0],
      [1,1],
    ]
  end
end