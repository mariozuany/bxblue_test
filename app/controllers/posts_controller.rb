class PostsController < ApplicationController
  before_action :authorize, only: %i[new create edit update destroy]

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5)

    query_params.each do |key, value|
      @posts = @posts.public_send(key, value) if value.present?
    end

    @posts = @posts.order(created_at: :desc)

  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path unless @post.attributes['user_id'] == current_user.id
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
    @post = Post.find(params[:id])
    redirect_to posts_path unless @post.attributes['user_id'] == current_user.id

    @post.destroy
    redirect_to posts_path
  end

  private

  def query_params
    params.permit(:city, :country, :weather_condition, :temperature_celsius)
  end

  def post_params
    params.require(:post).permit(:body, :city, :country,
                                 :temperature_celsius, :latitude, :longitude,
                                 :weather_condition, :post_date)
  end
end