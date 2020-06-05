class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:is_approved => true).order(created_at: :desc)
  end

  def pending
    @posts = Post.where.not(:is_approved => true).order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post
    # abort post_params.inspect

    respond_to do |format|
      if @post.update_attributes(post_params)
        if post_params["is_approced"]
          PostMailer.post_approved(current_user, @post).deliver
        end
        format.html { redirect_to @post, notice: "Post has been successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize @post
    abort
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post has been successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  # Only allow a list of trusted parameters through.
  def post_params

    # puts params
    params.require(:post).permit(:title, :content, :user_id, :image, :remove_image, :is_approved, :approved_by, :approved_date)
  end
end
