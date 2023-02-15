require 'rails_helper'

RSpec.describe "Lists", type: :request do

  let(:image) {
    Rack::Test::UploadedFile.new(
      Rails.root.join("app/assets/images/no-photo-icon-28.jpg")
    )
  }

  let(:user) {
    User.create(email: "test@gmail.com", password: "testpass", password_confirmation: "testpass")
  }  

  let(:valid_attributes) {
    { title: "My Veggy list" }
  }

  describe "GET /index" do

    it "should get saved lists of a user when signed in" do
      sign_in user
      get lists_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /list" do
    it "should show list and its contents" do
      sign_in user
      post lists_url, params: { list: valid_attributes }

      get list_url(List.last)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /lists" do
    it "should successfully save a list with valid params" do
      sign_in user
      post lists_url, params: { list: valid_attributes }

      expect(response).to have_http_status(:created)
    end

    it "should increase list count by 1" do
      sign_in user
      expect{ post lists_url, params: { list: valid_attributes }}.to change(List, :count).by(1)
    end
  end

  describe "DELETE /list" do
    it "should destroy the requested list" do
      sign_in user
      post lists_url, params: { list: valid_attributes }
      
      expect { delete list_url(List.last) }.to change(List, :count).by(-1)
    end
  end

end
