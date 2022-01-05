class Api::SearchesController < ApplicationController
  def user_search
    result = User.exists?(twitter_id: params[:id])
    render json: result
  end
end
