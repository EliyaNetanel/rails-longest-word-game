class GamesController < ApplicationController
  def new
    @letters = [*("A".."Z")].sample(10)
  end

  def score
    @letters = params[:letters].split(",")
    @score = Game.run(@letters ,params[:word])
    session[:score] += @score[0]
  end
end
