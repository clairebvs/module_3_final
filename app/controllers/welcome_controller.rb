class WelcomeController < ApplicationController
  def index
    @word_facade = WordFacade.new(word_params[:q])
  end

  private

  def word_params
    params.permit(:q)
  end
end
