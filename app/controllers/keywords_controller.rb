class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.last(5)
    # @tweets = Tweet.all
  end

  def show
    #accept ajax, call to Twitter API, write info to DB, then show tweets
    keyword = params[:keyword]
    @tweets = []
    $twitter.search("#{keyword}", result_type: "recent").take(3).each do |tweet|
      # Tweet.create(keyword_id: this_keyword.id, content: tweet.text, url: tweet.uri)
      @tweets << tweet
    end
    render json: {tweets: @tweets}.to_json
  end
end
