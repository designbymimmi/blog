class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC") #grabs all the posts and order them from newest to oldest
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    if @post.save # if saving post was successful, redirect user to the new post
      redirect_to @post
    else # else go back to create new post
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private 

  def find_post
    @post = Post.find(params[:id]) #for the post, find the id of that post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
