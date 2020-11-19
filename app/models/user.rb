class User < ApplicationRecord
    validates :name, presence: true
    validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, if: :email
end
