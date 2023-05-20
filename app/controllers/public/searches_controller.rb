class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Tag"
      @posts = Post.tag_looks(params[:search], params[:keyword])
    else
      @posts = Post.looks(params[:search], params[:keyword])
    end

  end
end