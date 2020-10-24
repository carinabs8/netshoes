require 'rails_helper'

RSpec.describe VideosController, :type => :controller do
  let(:user) {create(:user, role: :admin)}

  describe "GET 'new'" do
    context "As Admin" do
      it "Should be access " do
        sign_in(user)
        get 'new'
        expect(response).to have_http_status(:success)
      end

    end
    context "As non logged user" do
      it "Should not access this page" do
        get 'new'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET 'create'" do
    context "As Admin" do

      it "Should not be redirect if its not a valid created record" do
        sign_in(user)
        post :create, params: {video: {url: "", name: ""}}
        expect(response).not_to have_http_status(:redirect)
      end

      it "Should be redirect to videos" do
        sign_in(user)
        post :create, params: {video: {url: Faker::Internet.url(host: 'example.com', path: '/foobar.m3u8'), name: "new_video"}}
        expect(response).to redirect_to(videos_path)
      end
    end

    context "As non logged user" do
      it "Should not access this page" do
        get 'new'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET 'index'" do
    context "non logged user" do
      it "Should return '200 ok'" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
