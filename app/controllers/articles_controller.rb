class ArticlesController < ApplicationController
  def index
    @articles = Article.all # line added
  end

  # CRUD R read
  def show
    @article = Article.find(params[:id])
  end

  # CRUD C new
  def new
    @article = Article.new
  end

  # CRUD C create
  def create
    @article = Article.new(article_params)
    #@article = Article.new(title: "...", body: "...") #original way 

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # CRUD U edit
  def edit
    @article = Article.find(params[:id])
  end

  # CRUD U update  
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # CRUD D destroy or delete  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # private method
  private
  def article_params
    # params.require(:article).permit(:title, :body)
    params.require(:article).permit(:title, :body, :status)
  end
end
