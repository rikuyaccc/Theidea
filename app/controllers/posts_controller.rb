class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def ensure_correct_user
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to posts_path 
    end
  end

  def index
    @posts = Post.all.order(:desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end
  
    def edit
      @post = Post.find(params[:id])
    end

    def update
      Post.find(params[:id]).update(post_params)
      redirect_to posts_path
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end

    private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end

    
end
