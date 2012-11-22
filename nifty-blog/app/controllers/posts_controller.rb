class PostsController < ApplicationController
  after_filter :verify_authorized, :except => :index
  rescue_from Pundit::NotAuthorizedError, :with => :record_not_found

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(params[:post])
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end

  private

  def record_not_found
    redirect_to posts_url, :alert => "Couldn't find post"
  end
end
