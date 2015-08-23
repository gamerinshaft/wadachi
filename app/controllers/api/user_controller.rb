class Api::UserController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def create_params
    params.require(:comment).permit(:author, :text)
  end
end
