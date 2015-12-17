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

  test "#followed_tweets" do
    VCR.use_cassette("twitter_service#followed_tweets") do
      tweets = service.home_timeline
      tweet = tweets.first

      assert_equal 20, tweets.count
      assert tweet[:text].include?("Yoga teachers")
    end
   end

   test "#followers_count" do
     VCR.use_cassette("twitter_service#followers_count") do

       assert_equal 6, service.followers.count
     end
   end

   test "#following_count" do
     VCR.use_cassette("twitter_service#following_count") do

       assert_equal 20, service.following.count
     end
   end

   # twitter.stubs(:update),returns(Twitter::Tweet).new(id:200)
   # assert_euqal Twitter:Tweet, twitter.tweet("Tweet Test")

end
