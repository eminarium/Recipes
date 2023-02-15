require 'rails_helper'

RSpec.describe Instruction, type: :model do

  describe "Validations" do

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

    subject{
      described_class.new(content: "Just an instruction", recipe: recipe)
    }

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without a recipe" do
      subject.recipe_id = nil
      expect(subject).to_not be_valid
    end

    describe "Validations" do
      it { should validate_presence_of(:content) }
      it { should validate_presence_of(:recipe_id) }
    end
  end

  describe "Associations" do
    it { should belong_to(:recipe) }
  end
end