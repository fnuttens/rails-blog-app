require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Test the validity of the Category model" do
    it "is valid with valid attributes" do
      category = Category.new(name: "My category")
      expect(category).to be_valid
    end
    it "is not valid without a name" do
      category = Category.new
      expect(category).not_to be_valid
    end
  end
end
