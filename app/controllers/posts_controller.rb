class PostsController < ApplicationController

  def index
    #get posts of an author if an author_id is in params
    #ex: authors/:id/posts
    #params[author_id] is provided through nested route
    if params[:author_id]
      @posts = Author.find(params[:author_id]).posts
    #get all posts 
    else
      @posts = Post.all
    end
  end
 
  def show
    @post = Post.find(params[:id])
  end
  

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
