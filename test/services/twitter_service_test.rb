require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
   user = OpenStruct.new(oauth_token: ENV["ACCESS_TOKEN"], oauth_token_secret: ENV["ACCESS_SECRET"])
   @service = TwitterService.new(user)
 end

 test "#my_tweets" do
   VCR.use_cassette("twitter_service#my_tweets") do
     tweets = service.user_timeline
     tweet = tweets.first

     assert_equal 5, tweets.count
     assert_equal "NewTest", tweet[:text]
   end
  end

end
