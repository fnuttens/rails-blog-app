class Category < ApplicationRecord
    validates :name, presence: true

    has_many :article_to_categories
    has_many :articles, through: :article_to_categories
end
