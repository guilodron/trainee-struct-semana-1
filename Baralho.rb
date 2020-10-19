require_relative "Carta"

class Baralho
  attr_reader :cartas
  
  def initialize
    @cartas = Array.new
  end

  def addCard(card)
    @cartas.push(card)
    return @cartas
  end

  def sort
    @cartas.sort_by!{|card| card.simbolo}
    return @cartas
  end

  def shuffle
    @cartas.shuffle!
    return @cartas
  end

  def humanIndex
    return @cartas.map{|card| card.show}
  end

  def size
    return @cartas.size
  end

  def pull
    return @cartas.delete_at(rand(self.size))
  end
end