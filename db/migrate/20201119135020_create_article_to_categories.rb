class CreateArticleToCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_to_categories do |t|
      t.belongs_to :article, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
