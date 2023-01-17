require 'rails_helper'

RSpec.describe Recipe, type: :model do

  describe "Validations" do
    let(:user) {
      User.create(email: "test.user@gmail.com", password: "testpass", password_confirmation: "testpass")
    }

    subject { 
      described_class.new(title: "Chicken Biryani",
                          brief_info: "Brief info about Chicken Biryani",
                          user_id: user.id
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid 
    end

    it "is not valid without a brief_info" do
      subject.brief_info = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a user" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:title) } 
    it { should validate_presence_of(:brief_info) }
    it { should validate_presence_of(:user_id) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:instructions) }
    it { should have_many(:likes) }
  end
end