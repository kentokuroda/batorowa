class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :new, :create, :destroy]
  
  def index
    @microposts = Micropost.all.order(id: :desc).page(params[:page])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
