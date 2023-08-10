class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post updated!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted!'
  end

  def publish
    if @post.update(published: true)
      redirect_to posts_path, notice: 'Post published!'
    else
      flash.now[:error] = 'Error publishing post'
      render :show
    end
  end

  def unpublish
    if @post.update(published: false)
      redirect_to posts_path, notice: 'Post unpublished!'
    else
      flash.now[:error] = 'Error unpublishing post'
      render :show
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
