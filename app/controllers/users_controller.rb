class UsersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index, :new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.create(get_user_params)
    puts @user.errors.full_messages
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  private
  def get_user_params
    params.require(:user).permit(:name, :happiness, :height, :nausea, :admin, :tickets, :password)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def logged_in?
    if session[:user_id] != nil
      true
    else
      false
    end
  end



end
