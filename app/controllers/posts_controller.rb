class PostsController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page])
    @effort = Effort.find_by(user: current_user)

    partner = User.where.not(id: current_user.id).where(relationship_id: current_user.relationship_id)
    if partner == []
      return
    elsif partner
      @partner = partner[0][:name]
    end

    @partner_effort = Effort.find_by(user: partner)
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
      redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human), status: :see_other
  end

  private

  def set_user
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :date, :image, :image_cache)
  end
end
