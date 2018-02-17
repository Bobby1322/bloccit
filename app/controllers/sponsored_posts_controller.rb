class SponsoredPostsController < ApplicationController
  before_action :set_sponsored_post, only: [:show, :edit, :update, :destroy]

  # GET /sponsored_posts
  # GET /sponsored_posts.json
  def index
    @sponsored_posts = SponsoredPost.all
  end

  # GET /sponsored_posts/1
  # GET /sponsored_posts/1.json
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  # GET /sponsored_posts/new
  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  # GET /sponsored_posts/1/edit
  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  # POST /sponsored_posts
  # POST /sponsored_posts.json
  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  # PATCH/PUT /sponsored_posts/1
  # PATCH/PUT /sponsored_posts/1.json
  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = "Post was updated."
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  # DELETE /sponsored_posts/1
  # DELETE /sponsored_posts/1.json
  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.destroy
      flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
      redirect_to @sponsored_post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsored_post
      @sponsored_post = SponsoredPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsored_post_params
      params.require(:sponsored_post).permit(:title, :body, :price)
    end
end
