require_relative "Baralho"
require_relative "Carta"

class JogoDePoker < Baralho
  
  attr_reader :stage, :bet
  
  def initialize
    @stage = 0
    @tableCards = []
    @bet = 0
    @players = []
  end

  def addPlayer(name)
    if @stage === 0 
      cartas = []
      2.times do
        cartas.push(Carta.new)
      end
      @players.push({
        id: @players.size + 1,
        nome: name,
        dinheiro: 1000,
        cartas: cartas,
        noJogo: true,
      })    
    else
      return
    end
  end

  def showCards
    if @stage === 0
      return
    end
    @tableCards[0..@stage + 1].each_with_index do |carta, index|
      puts "Carta #{index + 1}: #{carta.show[:simbolo]} de #{carta.naipe}"
    end    
  end

  def progressStage
    @stage += 1
    case @stage
    when 1
      5.times do
        @tableCards.push(Carta.new)
      end
      showCards()
    when 2
      showCards()
    when 3
      showCards()
    else
      @stage = 0
      @tableCards = []      
    end      
  end

  def raiseBet(value, player_id)
    puts value
    @players.each do |player|
      if (player[:dinheiro] >= value)
        puts "#{player[:nome]} deseja aceitar o aumento de #{value}? S(sim)/N(não)"
        input = gets.chomp
        if input == 's' || input == 'S'
          @bet = @bet + value
          player[:dinheiro] -= value
        else
          player[:noJogo] = false
        end
      else
        puts "#{player[:nome]} deseja apostar todo seu dinheiro? S(sim)/N(não)"
        input = gets
        if input == 's' || input == 'S'
          @bet = @bet + value
          player[:dinheiro] -=  value
        else
          player[:noJogo] = false
        end
      end    
    end
  end

  def winner(player_id)
    @players[player_id - 1][:dinheiro] += @bet
    @bet = 0
    @tableCards = []
    @players.each do |player|
      player[:noJogo] = true
    end
  end

end