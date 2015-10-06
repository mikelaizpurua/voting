require "./voter.rb"
require "./politician.rb"

class World
  attr_accessor :politicians, :voters

  def initialize
    @politicians = []
    @voters = []
  end

  def run_election
    population = @politicians + @voters

    score_board = {}

    @politicians.each do |politician|
      score_board[politician.name] = 0
    end

    population.each do |person|
      politician = person.vote(@politicians)
      score_board[politician.name] += 1
    end

    score_board
  end
end

world = World.new
world.politicians << Politician.new("Trump", "R") << Politician.new("Hillary", "D")
world.voters << Voter.new("Jake", "T") << Voter.new("Mary", "L") << Voter.new("Bill", "C")

p world.run_election



