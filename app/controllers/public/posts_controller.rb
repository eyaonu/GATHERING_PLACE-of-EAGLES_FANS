class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    @post = current_user.post
    @total = 0
    @post.each do |post| 
      # tal = cart_item.item.non_taxed_price * cart_item.amount

    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
# '/top'
    else
      render :new
    end
  end

  def index
    @posts = current_user.posts
    # @posts = post.all 
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.post_tags
  end

  def edit
    @post = Post.find(params[:id])
    @post_tags = @post.post_tags
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.update(post_params)
    flash[:notice] = "You have creatad post successfully."
    redirect_to  post_path(@post.id)
    else
    render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
      if @post.destroy
      flash[:notice]="Post was successfully destroyed."
      redirect_to '/posts'
      end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end