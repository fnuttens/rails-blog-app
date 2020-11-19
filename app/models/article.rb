class Article < ApplicationRecord
    validates :title, presence: true
    validates :contents, presence: true

    belongs_to :author
    has_many :article_to_categories
    has_many :categories, through: :article_to_categories
end
