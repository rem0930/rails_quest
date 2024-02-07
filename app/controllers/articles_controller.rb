class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: "成功！"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Success!"
    else
      render :edit
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, :content, :tag_list)
    end
end
