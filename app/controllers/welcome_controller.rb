class WelcomeController < ApplicationController
  def index
    # require "pry"; binding.pry
    @word_facade = WordFacade.new(word_params[:word])
  end

  private

  def word_params
    params.permit(:word)
  end
end
