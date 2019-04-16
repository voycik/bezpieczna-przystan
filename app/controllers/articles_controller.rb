# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  before_action :authorize_article, only: %i[edit update destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 7)
  end

  def show; end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      params[:article][:image_data].each do |file|
        @article.images.create!(image: file)
      end if params[:article][:image_data]
      flash[:success] = 'Post opublikowany'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Post zaktualizowany'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Post usunięty'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, image_data: [])
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def authorize_article
    authorize @article
  end
end
