class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.last(5)
    # @tweets = Tweet.all
  end

  def show
    #accept ajax, call to Twitter API, write info to DB, then show tweets
    p params
    keyword = params[:keyword]
  end
end
