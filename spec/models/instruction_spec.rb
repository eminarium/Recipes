require 'rails_helper'

RSpec.describe Instruction, type: :model do

  describe "Validations" do

    let(:user) { create(:user) }
    let(:recipe) { create(:recipe) }

    subject{ create(:instruction) }

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