class Api::V1::GamesController < ApplicationController
  def show
    render json: game
  end

  private
  def game
    Game.find(params[:id].to_i)
  end
end
