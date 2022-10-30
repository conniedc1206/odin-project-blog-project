class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # The new action instantiates a new article, but does not save it. This article will be used in the view when building the form. By default, the new action will render app/views/articles/new.html.erb, which we will create next.
  def new
    @article = Article.new
  end

  # The create action instantiates a new article with values for the title and body, and attempts to save it. If the article is saved successfully, the action redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}". Else, the action redisplays the form by rendering app/views/articles/new.html.erb with status code 422 Unprocessable Entity. 
  def create
    @article = Article.new(article_params)

    if @article.save
      redirects_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # The edit action fetches the article from the database, and stores it in @article so that it can be used when building the form.
  def edit
    @article = Article.find(params[:id])
  end

  # The update action (re-)fetches the article from the database, and attempts to update it with the submitted form data filtered by article_params. If no validations fail and the update is successful, the action redirects the browser to the article's page. Else, the action redisplays the form — with error messages — by rendering app/views/articles/edit.html.erb.
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirects_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # strong params for handling invalid user input is another step of that process. 
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
