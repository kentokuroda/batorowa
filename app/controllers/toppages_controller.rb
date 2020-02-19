class ToppagesController < ApplicationController
  def index
    if logged_in?
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
    end
  end
end
