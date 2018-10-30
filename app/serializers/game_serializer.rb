class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [
      {
        user_id: player_1.id,
        score: player_1.score
      },
      {
        user_id: player_2.id,
        score: player_2.score
      }
    ]
  end

  private
  def player_1
    User.find(object.player_1_id)
  end

  def player_2
    User.find(object.player_2_id)
  end
end
