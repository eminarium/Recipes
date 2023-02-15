require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    subject {
      described_class.new(
        email: "test@gmail.com", password: "testpass", password_confirmation: "testpass"
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without matching passwords" do
      subject.password = "abc"
      subject.password_confirmation = "def"
      expect(subject).to_not be_valid
    end

    describe "Validations" do
      it { should validate_presence_of(:email) }
    end

  end

  describe "Associations" do
    it { should have_many(:cooked_recipes) }
    it { should have_many(:liked_recipes) }
    it { should have_many(:followees) }
    it { should have_many(:followers) }
    it { should have_many(:recipes) }
    it { should have_many(:lists) }
  end
end