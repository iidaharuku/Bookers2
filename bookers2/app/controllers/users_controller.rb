class UsersController < ApplicationController

  

  def index
    @user = current_user
    @book = @user.books.new
    @users = User.all
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books.new
    
  end
  
  def edit
    @user = User.find(params[:id])
      unless @user == current_user
      redirect_to user_path(current_user)
      end
  end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'User was successfully updated'
    else
      render :edit
    end
   end


  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



end
