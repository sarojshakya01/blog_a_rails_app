class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    post_id = comment_params["post_id"]

    @post = Post.find(post_id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    authorize @comment
    post_id = comment_params["post_id"]

    @post = Post.find(post_id)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: "Comment has been successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    authorize @comment
    @post = Post.find(@comment.post_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: "Comment has been successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
