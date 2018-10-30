class User < ApplicationRecord
  has_many :plays

  def score
    plays.sum(:score)
  end
end
