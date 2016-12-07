class UsersController < ApplicationController
  before_action :set_user_basic, only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @age = calc_user_age
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
      redirect_to user_path, notice: '基本情報を編集しました'
    else
      render 'edit'
    end
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

  # 年齢を計算する
  def calc_user_age
    date_format = "%Y%m%d"
    user_birthday = @user.birthday
    if user_birthday.blank?
      ""
    else
      age = (Date.today.strftime(date_format).to_i - user_birthday.strftime(date_format).to_i)/10000
      ageString = "#{age} さい"
    end

  end
end
