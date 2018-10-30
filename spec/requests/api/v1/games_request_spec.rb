require 'rails_helper'

describe 'GET /api/v1/games/:id' do
  it 'returns a json response including game data' do
    josh = User.create(name: "Josh")
    sal = User.create(name: "Sal")
    game = Game.create(id: 1, player_1_id: josh, player_2_id: sal)

    josh.plays.create(game_id: game.id, word: "sal", score: 3)
    josh.plays.create(game_id: game.id, word: "zoo", score: 12)
    sal.plays.create(game_id: game.id, word: "josh", score: 14)
    sal.plays.create(game_id: game.id, word: "no", score: 2)

    get "/api/v1/games/#{game.id}"

    expect(response.status).to eq 200

    game = JSON.parse(response.body, symbolize_names: true)

    expect(game.count).to eq 1
    expect(game).to have_key(:game_id)
    expect(game).to have_key(:scores)

    expect(game[:scores].count).to eq 2
    expect(game[:scores][0]).to have_key(:user_id)
    expect(game[:scores][0]).to have_key(:score)
  end
end

# GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
