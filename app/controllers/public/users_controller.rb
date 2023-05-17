class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "メールアドレスを更新しました"
      redirect_to users_path
    else
      render :edit
    end
  end

  def bookmark_posts
    @user = User.find(params[:id])
    @posts = @user.bookmark_posts
  end

  def comment_posts
    @user = User.find(params[:id])
    @posts = @user.comment_posts
  end

  def delete_verification
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

  end

  def withdraw
    @user = current_user

    #is_deletedカラムをtrueに変更する
    @user.update(is_deleted: true)

    # ログアウトさせる
    reset_session
    redirect_to root_path 
  end

  def unsubscribe
    @user = current_user
  end

  def delete_verification

  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :name,
                                 :address,
                                 :is_deleted)
  end
end