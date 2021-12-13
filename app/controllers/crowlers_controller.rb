class CrawlersController < ApplicationController

  def show
    # current_user
    @share_letter_image = url("/img/mybox/jpg")
    # public/img/mybox.jpgをツイート時のデフォルトのOGP画像として反映させること・動的に変更する条件分岐
  end

  private

  # 参考

  # def set_arrangement
  #   @arrangement = Arrangement.find(decode_id(params[:id]))
  # rescue StandardError => e
  #   render_404(e)
  # end
end
