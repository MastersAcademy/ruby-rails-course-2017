class LandingController < ApplicationController
  def index
    @articles = Article.where('show_on_site = ? AND show_on_main_page = ? AND event_review = ?',
     true, true, false).order('updated_at DESC')
    @events_reviews = Article.where('show_on_site = ? AND show_on_main_page = ? AND event_review = ?',
     true, true, true).order('updated_at DESC')
  end
end
