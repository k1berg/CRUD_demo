class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
      flash[:success] = 'Created'
    else
      render :new
      flash[:failure] = 'Fail'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
