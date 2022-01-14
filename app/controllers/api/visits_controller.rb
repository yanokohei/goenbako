class Api::VisitsController < ApplicationController
  def random
    fetch_user = User.where('id >= ?', rand(User.first.id..User.last.id)).first.twitter_id
    render json: fetch_user
  end
end
