class EventsReviewsController < ApplicationController
  def index
    @events_reviews = @articles = Article.where('show_on_site = ? AND event_review = ?', true, true).order('created_at DESC')
  end
end
