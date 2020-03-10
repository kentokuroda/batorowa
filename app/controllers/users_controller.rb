class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :myrooms]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if current_user == @user
      
      if @user.update(user_params)
        flash[:success] = 'プロフィールを編集しました。'
        redirect_to action: :show
      else
        flash.now[:danger] = '編集に失敗しました'
        render :edit
      end
    
    else
      redirect_to root_url
    end
  end
  
  
  def myrooms
    @users = current_user
    @myrooms = @users.myrooms.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :platform, :password, :password_confirmation, :introduce, :sex, :age, :address, :image, :remember_digest)
  end
end
