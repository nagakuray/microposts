class UsersController < ApplicationController
  before_action :set_user_basic, only: [:edit, :update]
  before_action :block_invalid_user, only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @age = calc_user_age
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(25)
    @micropost = current_user.microposts.build

  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:info] = "#{@user.name}の基本情報を編集しました "
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
    @title = "Followings"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
    @title = "Followers"
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :birthday,:blood,:birthplace)
  end

  def set_user_basic
    @user = User.find(params[:id])
  end

  # ログインユーザと一致しない場合はroot_pathにリダイレクトする
  def block_invalid_user
    if current_user != @user
      redirect_to root_path
    end
  end

  # 年齢を計算する
  def calc_user_age
    date_format = "%Y%m%d"
    user_birthday = @user.birthday
    if user_birthday.blank?
      ""
    else
      age = (Date.today.strftime(date_format).to_i - user_birthday.strftime(date_format).to_i)/10000
      age_string = "#{age} さい"
      age_string
    end
  end
end
