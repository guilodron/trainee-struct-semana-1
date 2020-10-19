class Carta

  attr_reader :naipe, :simbolo
  @@naipes = ["paus", "copas", "ouros", "espadas"]

  # Atribui valores aleatórios caso não sejam especificados
  def initialize(naipe = @@naipes.sample, simbolo = rand(1..13))
    @naipe = naipe 
    @simbolo = simbolo
  end

  def show
    simbol = {}
    case @simbolo
    when 1
      simbol[:simbolo] = 'As'
    when 11
      simbol[:simbolo] = 'J'
    when 12
      simbol[:simbolo] = 'Q'
    when 13
      simbol[:simbolo] = 'K'
    else
      simbol[:simbolo] = @simbolo
    end

    return simbol
  end
end
