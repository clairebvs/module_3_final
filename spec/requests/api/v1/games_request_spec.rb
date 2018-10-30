require 'rails_helper'

describe 'GET /api/v1/games/:id' do
  it 'returns a json response including game data' do
    josh = User.create(name: "Josh")
    sal = User.create(name: "Sal")
    game = Game.create!(player_1_id: josh.id, player_2_id: sal.id)

    josh.plays.create(game_id: game.id, word: "sal", score: 3)
    josh.plays.create(game_id: game.id, word: "zoo", score: 12)
    sal.plays.create(game_id: game.id, word: "josh", score: 14)
    sal.plays.create(game_id: game.id, word: "no", score: 2)

    get "/api/v1/games/#{game.id}"

    expect(response.status).to eq 200

    game = JSON.parse(response.body, symbolize_names: true)

    expect(game.count).to eq 2
    expect(game).to have_key(:game_id)
    expect(game).to have_key(:scores)

    expect(game[:scores].count).to eq 2
    expect(game[:scores][0]).to have_key(:user_id)
    expect(game[:scores][0]).to have_key(:score)
  end
end

describe 'POST api/v1/games/:id/plays' do
  it 'update the score of the current game' do
    josh = User.create(name: "Josh")
    sal = User.create(name: "Sal")
    game = Game.create(player_1_id: josh.id, player_2_id: sal.id)
    # require "pry"; binding.pry

    josh.plays.create(game_id: game.id, word: "sal", score: 3)
    josh.plays.create(game_id: game.id, word: "zoo", score: 12)
    sal.plays.create(game_id: game.id, word: "josh", score: 14)
    sal.plays.create(game_id: game.id, word: "no", score: 2)

    game_payload = { user_id: 1,
                     word: 'at' }

    post "/api/v1/games/#{game.id}/plays", params: game_payload

    expect(response.status).to eq 201
    # Then I should receive a 201 Created Response

    get "/api/v1/games/#{game.id}"

    expect(response.status).to eq 200
    game = JSON.parse(response.status)

    expect(game["scores"]).to eq(17)

# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":17
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
  end
end
