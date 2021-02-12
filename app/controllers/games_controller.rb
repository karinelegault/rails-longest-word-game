class GamesController < ApplicationController
  def new
    # The new action will be used to display a new random grid and a form
    @letters = Array.new(rand(1...30)) { ('A'..'Z').to_a.sample }
    # Then display it in the view.
  end

  def score
    # The form will be submitted (with POST) to the score action
    def included?(word)
      guess.chars.all? { |letter| word.count <= letters.count }
    end

      if included?(word:.upcase)
        if english_word?(word:)
          @result = "well done"
        else
          @result = "0, not an english word"
        end
      else
        @result = "0, not in the grid"
      end

    def english_word?(word)
      response = open("https://wagon-dictionary.herokuapp.com/#{word}")
      json = JSON.parse(response.read)
      return json['found']
    end
  end
end
