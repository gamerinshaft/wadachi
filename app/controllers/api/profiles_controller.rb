class Api::ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def update
    @user = User.find(params[:user_id])
    @user.profile.update_attributes(create_params)
    render json: @user.profile
  end

  def show
  end

  def edit
  end

  def destroy
  end
  private
  def create_params
    params.require(:profile).permit(:bio)
  end
end
