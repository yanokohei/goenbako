class CrawlersController < ApplicationController

  def show
    @share_letter_image = url("/img/mybox/jpg")
    # public/img/mybox.jpgをツイート時のデフォルトのOGP画像として反映させること・動的に変更する条件分岐
  end
end
