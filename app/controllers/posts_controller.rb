class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def new
    @post = Post.new(post_params(:title, :content, :category))
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    set_post!
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
