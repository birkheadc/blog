class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  http_basic_authenticate_with name: 'admin', password: ENV['RAILS_BLOG_PASSWORD'], except: %i[ index show ]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /articles or /articles.json
  def index
    id = Article.order(:created).last.id if Article.order(:created).last
    redirect_to controller: :articles, action: :show, id: id if id
    redirect_to controller: :error, action: :index unless id
  end

  # GET /articles/1 or /articles/1.json
  def show
    @prev_article_id = @article.prev ? @article.prev.id : nil
    @next_article_id = @article.next ? @article.next.id : nil
  end


  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created_at, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :sub_title, :content, :created, :edited, :language)
  end
end
