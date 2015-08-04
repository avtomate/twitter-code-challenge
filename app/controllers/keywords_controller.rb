class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.last(5)
    # @tweets = Tweet.all
  end

  def show
    #accept ajax, call to Twitter API, write info to DB, then show tweets
    keyword = Keyword.create(content: params[:keyword])
    @tweets = []
    $twitter.search("#{keyword.content}", result_type: "recent").take(3).each do |tweet|
      Tweet.create(keyword_id: keyword.id, content: tweet.text, url: tweet.uri)
      @tweets << tweet
    end
    # @keywords = Keyword.last(5)
    render json: {tweets: @tweets}.to_json
  end
end
