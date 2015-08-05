class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.last(10)
  end

  def show
    #accept ajax, call to Twitter API, write info to DB, then show tweets
    keyword = Keyword.create(content: params[:keyword])
    @tweets = []
    $twitter.search("#{keyword.content}", result_type: "recent").take(5).each do |tweet|
      Tweet.create(keyword_id: keyword.id, content: tweet.text, url: tweet.uri)
      @tweets << tweet
    end
    render json: {tweets: @tweets}.to_json
  end

  def keyword_tweets
    keyword = Keyword.where(content: params[:keyword]).first
    @tweets = Tweet.where(keyword_id: keyword.id)
    render json: {tweets: @tweets}.to_json
  end
end
