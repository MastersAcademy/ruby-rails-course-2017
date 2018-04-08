class ArticlesController < ApplicationController
  def index
    @articles = Article.where('show_on_site = ? AND event_review = ?', true, false).order('created_at DESC')
    Article.includes(:image_files).all
  end

  def show
    @article = Article.find(params[:id])
    Article.includes(:image_files).all
  end

end
