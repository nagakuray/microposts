class StaticPagesController < ApplicationController
  def home
  	if logged_in?
	  	@micropost = current_user.microposts.build
	  	# @user = User.find_by(params[:id])
	  	# @hogehoge = @user.microposts.build
	  	@feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page]).per(25)
	  end
  end
end
