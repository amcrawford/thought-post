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
    within("#welcome-page") do
      click_link_or_button "Login"
    end
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
     "uid"=>"4585868161",
     "info"=>
      {"nickname"=>"TestTes66512009",
       "name"=>"Test Test",
       "email"=>nil,
       "location"=>"",
       "image"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png",
       "description"=>"",
       "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/TestTes66512009"}},
     "credentials"=>{"token"=>"4585868161-13RM2YQNifdE3td3XxG2lZePjdsB0o7GdE7SPEj", "secret"=>"GX5P70vFgmHUuWGmcE8yp9amSHJukGnSrA1vBJEHgHMIW"},
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
            {"id"=>4585868161,
         "id_str"=>"4585868161",
         "name"=>"Test Test",
         "screen_name"=>"TestTes66512009",
         "location"=>"",
         "description"=>"",
         "url"=>nil,
         "entities"=>{"description"=>{"urls"=>[]}},
         "protected"=>false,
         "followers_count"=>0,
         "friends_count"=>0,
         "listed_count"=>0,
         "created_at"=>"Thu Dec 17 16:13:57 +0000 2015",
         "favourites_count"=>0,
         "utc_offset"=>nil,
         "time_zone"=>nil,
         "geo_enabled"=>false,
         "verified"=>false,
         "statuses_count"=>0,
         "lang"=>"en",
         "contributors_enabled"=>false,
         "is_translator"=>false,
         "is_translation_enabled"=>false,
         "profile_background_color"=>"F5F8FA",
         "profile_background_image_url"=>nil,
         "profile_background_image_url_https"=>nil,
         "profile_background_tile"=>false,
         "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png",
         "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png",
         "profile_link_color"=>"2B7BB9",
         "profile_sidebar_border_color"=>"C0DEED",
         "profile_sidebar_fill_color"=>"DDEEF6",
         "profile_text_color"=>"333333",
         "profile_use_background_image"=>true,
         "has_extended_profile"=>false,
         "default_profile"=>true,
         "default_profile_image"=>true,
         "following"=>false,
         "follow_request_sent"=>false,
         "notifications"=>false}}})
   end
end
