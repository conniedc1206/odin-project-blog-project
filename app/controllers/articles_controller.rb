class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirects_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # strong params for handling invalid user input is another step of that process. 
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
