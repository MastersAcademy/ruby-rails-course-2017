class AnnouncementsController < ApplicationController
  require 'koala'

  def index
    # @graph = Koala::Facebook::API.new('EAACGmrcnWT4BAGb4aKVNs0kHFZB3ZB2ijB0PIQoTjOPidZC96QqdX3zDEDe3rnowoG9ZAq6NQ7JN8qbcNu2eXziU41jW5tJhbwB8wMYoQugstoKzBXYAhkuWrA3sLEhLSL6oLQSallFCgWErysYCGOTta9ISqlxqS2OqJX4U3azPwaaZBjjpF5RQgkxLZCSk2pvE8ffNReygZDZD')
    # @user = @graph.get_object("me")
    # user = Authentication.where(user_id: current_user.id, provider: "facebook").first
    # oauth_access_token = user.token
    # @graph = Koala::Facebook::API.new(oauth_access_token)
    # @posts = @graph.get_connection('me', 'posts',{ fields: ['id', 'message', 'link', 'name', 'description', "likes.summary(true)", "shares", "comments.summary(true)"]})

    @announcements = Announcement.where('show_on_site = ?', true).order('created_at DESC')

  end

  def show
    @announcement = Announcement.find(params[:id])

  end
end
