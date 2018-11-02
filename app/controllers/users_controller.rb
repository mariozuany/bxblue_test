class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: current_user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id), notice: 'Thank you for signing up! Now create your profile.'
    else
      render 'new'
    end
  end

  def index
    @user = User.find_by(id: current_user)
    redirect_to new_user_path if @user.blank?
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :salt, :bio, :username, :fullname)
  end
end
