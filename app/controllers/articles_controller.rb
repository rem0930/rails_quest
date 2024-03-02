class ArticlesController < ApplicationController
  # POST /articles
  # POST /articles.json
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all
    render json: { articles: @articles }
  end

  def show
    render json: { article: @article }
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: { article: @article }, status: :created
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update(article_params)
      render json: { article: @article }, status: :ok
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :description)
    end
end
