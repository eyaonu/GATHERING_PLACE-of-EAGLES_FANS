class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:keyword])
    else
      @posts = Post.looks(params[:search], params[:tag])
    end
  end
end