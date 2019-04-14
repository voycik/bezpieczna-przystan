# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 7)
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
      flash[:success] = 'Post opublikowany'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Post zaktualizowany'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = 'Post usunięty'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end
end
