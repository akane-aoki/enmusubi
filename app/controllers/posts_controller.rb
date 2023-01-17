class PostsController < ApplicationController
  def index
    @q = post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.message.created', item: post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: post.model_name.human)
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(@post) 
      redirect_to posts_path, success: t('defaults.message.updated', item: post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: post.model_name.human)
  end

  private

  def set_user
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :date, :image)
  end
end
