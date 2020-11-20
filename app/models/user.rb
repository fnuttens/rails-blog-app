class User < ApplicationRecord
    validates :name, presence: true
    validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, if: :email

    after_create :send_greetings

    def send_greetings
        UserMailer.welcome_email(self).deliver_now
    end
end
