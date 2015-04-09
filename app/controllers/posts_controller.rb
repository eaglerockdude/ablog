class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  # GET /links/1
  def show

  end

  # GET /losts/new
  def new
    @post = Post.new
  end

  def create

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
     #before action gets post
  end

  def update
     #before action gets post
    if @post.update(post_params)
      redirect_to posts_path   #back to index
    else
      render 'edit'
    end
  end

  def destroy
     #before action gets post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
