module Api
  class VisitsController < ApplicationController
    def random
      fetch_user = User.offset(rand(User.count)).limit(1).first.twitter_id
      render json: fetch_user
    end
  end
end
