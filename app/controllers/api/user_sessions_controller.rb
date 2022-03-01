module Api
  class UserSessionsController < ApplicationController
  before_action :require_login, only: :destroy

    def destroy
      logout
      redirect_to root_path, notice: 'ログアウトしました'
    end
  end
end
