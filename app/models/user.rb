class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates_presence_of :first_name, :last_name

    has_many :courses, through: :user_courses
    has_many :posts
    has_many :comments

    before_save :generate_register_code

    enum role: %w[student tutor lecturer admin]

    def activate
        self.activated = true
        self.save
    end

    def deactivate
        self.activated = false
        self.save
    end

    def generate_register_code
        code = ''
        6.times do
            code += rand(0..9).to_s
        end
        self.register_code = code
    end

    def regenerate_regsiter_code
        self.generate_register_code
        self.save
    end

    def to_s
        return "#{self.first_name} #{self.last_name}"
    end

end
