require 'rails_helper'

RSpec.describe 'Recipes', type: :request do

  let(:image) {
    Rack::Test::UploadedFile.new(
      Rails.root.join("app/assets/images/no-photo-icon-28.jpg")
    )
  }

  let(:user) {
    User.create(email: "test@gmail.com", password: "testpass", password_confirmation: "testpass")
  }

  let(:recipe) {
    Recipe.create(title: "Chicken Biryani", brief_info: "Just a brief info", user_id: user.id, image: image)
  }

  let(:valid_attributes) {
    { title: "Chicken Biryani", brief_info: "Just a brief info", image: image }
  }

  describe "GET /recipes" do
    it "should list recipes without a user signed in" do
      get recipes_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /recipes" do
    it "should save a recipe with valid attributes" do
      sign_in user
      post recipes_url, params: { recipe: valid_attributes }

      expect(response).to have_http_status(:created)
    end

    it "should increase Recipe count by 1" do
      sign_in user
      
      expect { post recipes_url, params: { recipe: valid_attributes }}.to change(Recipe, :count).by(1)
    end
  end


  describe "DELETE /destroy" do
    it "destroys the requested recipe" do
      sign_in user

      expect { delete recipe_url(Recipe.last) }.to change(Recipe, :count).by(-1)
    end
  end

end