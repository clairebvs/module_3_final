class Api::V1::Games::PlaysController < ApplicationController
  def create
    render json: play, status: 201
  end

  private

  def game
    Game.find(play_params[:id])
  end

  def play
    game.plays.create(user_id: params[:user_id], word: params[:word])
  end

  def play_params
   params.permit(:id, :user_id, :word)
  end
end
