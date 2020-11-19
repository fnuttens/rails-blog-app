class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Your article has been successfully saved"
      redirect_to article_path(@article)
    else
      flash[:alert] = "An error has occurred"
      render 'new'
    end
  end

  # DELETE /articles/:id
  def destroy
    if @article.destroy
      flash[:notice] = "Article correctly deleted"
      redirect_to articles_path
    else
      flash[:alert] = "An error has occurred"
      redirect_back(fallback_location: root_path)
    end
  end

  # PUT /articles/:id
  def update
    if @article.update(article_params)
      flash[:notice] = "Article correctly modified"
      redirect_to article_path(@article)
    else
      flash[:alert] = "An error has occurred"
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :contents)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
