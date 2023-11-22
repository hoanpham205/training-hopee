class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice:'User was successfully created'  }
        format.json {render json: @user, status: :created, location: @user}
      else
        format.html {render action: "new"}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_path, notice:'User was successfully deleted' }
      format.json {head :no_content}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

