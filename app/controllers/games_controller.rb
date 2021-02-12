class GamesController < ApplicationController
  def new
    # The new action will be used to display a new random grid and a form
    @letters = Array.new(rand(1...30)) { ('A'..'Z').to_a.sample }
    # Then display it in the view.
  end

  def score
    # The form will be submitted (with POST) to the score action
    @letters = params[:letters].split
    @word = params[:word].upcase
    @valid = valid?(@word, @letters)
  end

  private

  def valid?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letter.count(letter) }
  end
end
