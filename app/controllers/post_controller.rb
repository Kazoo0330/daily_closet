# post_controller.rb
class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post  = Post.new(post_params)
    # user_id reminder.
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: "投稿の編集ができました。"
    end
  end
end
