class User < ApplicationRecord

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates_presence_of :first_name, :last_name

    def welcome
        "Hello, #{self.first_name}!"
    end

end
