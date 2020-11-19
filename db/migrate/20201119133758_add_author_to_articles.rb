class AddAuthorToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author, index: true
  end
end
