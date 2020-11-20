require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Test the validity of the Article model" do
    before(:all) do
        Author.destroy_all
        @author = FactoryBot.create(:author)
    end

    it "is valid with valid attributes" do
      article = Article.new(title: "My article", contents: "my content")
      article.author = @author
      expect(article).to be_valid
    end
    it "is not valid without a title" do
      article = Article.new(contents: "my content")
      article.author = @author
      expect(article).not_to be_valid
    end
  end
end
