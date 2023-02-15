require 'rails_helper'

RSpec.describe List, type: :model do

  describe "Validations" do

    let(:user) {
      User.create(email: "test@gmail.com", password: "testpass", password_confirmation: "testpass")
    }

    subject {
      described_class.new(
        title: "Test list",
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

    it "is not valid without a user reference" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    describe "Validations" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:user_id) }
    end

  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:recipes) }
  end

end
