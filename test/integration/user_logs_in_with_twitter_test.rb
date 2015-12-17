require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = ApiCuriousTwitter::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link_or_button "Login"
    # assert_equal "/users", current_path
    assert page.has_content?("Test")
    assert page.has_link?("Logout")
  end


  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      {"provider"=>"twitter",
       "uid"=>"47199626",
       "info"=>
        {"nickname"=>"Amber__C",
         "name"=>"AMC",
         "email"=>nil,
         "location"=>"",
         "image"=>"http://pbs.twimg.com/profile_images/2617777889/7y3q1ssh4tno6zlc50ry_normal.jpeg",
         "description"=>"",
         "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/Amber__C"}},
       "credentials"=>{"token"=>"47199626-SalEguuv6JMpqB4FwLJcC8zs6OaC51vXrSvTvwbnx", "secret"=>"bZpm1SMiBjavXzjC6PcdOPUYNwhW0DxID96LtdNTbBQfM"},
       "extra"=>
        {"access_token"=>
              {:signature_method=>"HMAC-SHA1",
               :request_token_path=>"/oauth/request_token",
               :authorize_path=>"/oauth/authenticate",
               :access_token_path=>"/oauth/access_token",
               :proxy=>nil,
               :scheme=>:header,
               :http_method=>:post,
               :oauth_version=>"1.0",
               :site=>"https://api.twitter.com"},
         "raw_info"=>
          {"id"=>47199626,
           "id_str"=>"47199626",
           "name"=>"AMC",
           "screen_name"=>"Amber__C",
           "location"=>"",
           "description"=>"",
           "url"=>nil,
           "entities"=>{"description"=>{"urls"=>[]}},
           "protected"=>false,
           "followers_count"=>6,
           "friends_count"=>20,
           "listed_count"=>0,
           "created_at"=>"Sun Jun 14 23:06:00 +0000 2009",
           "favourites_count"=>46,
           "utc_offset"=>-18000,
           "time_zone"=>"Quito",
           "geo_enabled"=>false,
           "verified"=>false,
           "statuses_count"=>5,
           "lang"=>"en",
           "contributors_enabled"=>false,
           "is_translator"=>false,
           "is_translation_enabled"=>false,
           "profile_background_color"=>"C0DEED",
           "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
           "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
           "profile_background_tile"=>false,
           "profile_image_url"=>"http://pbs.twimg.com/profile_images/2617777889/7y3q1ssh4tno6zlc50ry_normal.jpeg",
           "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/2617777889/7y3q1ssh4tno6zlc50ry_normal.jpeg",
           "profile_link_color"=>"0084B4",
           "profile_sidebar_border_color"=>"C0DEED",
           "profile_sidebar_fill_color"=>"DDEEF6",
           "profile_text_color"=>"333333",
           "profile_use_background_image"=>true,
           "has_extended_profile"=>false,
           "default_profile"=>true,
           "default_profile_image"=>false,
           "following"=>false,
           "follow_request_sent"=>false,
           "notifications"=>false}}})
   end
end
