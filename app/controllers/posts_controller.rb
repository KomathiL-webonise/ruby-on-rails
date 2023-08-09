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
      @post.publish
      redirect_to posts_path, notice: 'Post published!'
    end
  
    def unpublish
      @post.unpublish
      redirect_to posts_path, notice: 'Post unpublished!'
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :published)
    end
  
   
  end
  