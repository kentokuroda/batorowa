class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :new, :create, :destroy]
  
  def index
    @microposts = Micropost.all.order(id: :desc).page(params[:page])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(microposts_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @micropsts = current_user.micropots.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  end
  

  def destroy
  end
  
  private
  
  def microposts_params
    params.require(:micropost).permit(:title, :platform, :content)
  end
end
