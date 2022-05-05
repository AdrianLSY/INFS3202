class User < ApplicationRecord
    
    # t.string :first_name
    # t.string :last_name
    # t.string :email
    # t.string :password_digest
    # t.integer :role
    # t.integer :register_code, default: ''
    # t.boolean :activated, default: false

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates_presence_of :first_name, :last_name

    before_save :generate_register_code

    enum role: %w[student tutor lecturer]

    def activate()
        self.activated = true
        self.save
    end

    def deactivate()
        self.activated = false
        self.save
    end

    def generate_register_code()
        code = ''
        6.times do
            code += rand(0..9).to_s
        end
        self.register_code = code
    end

    def regenerate_regsiter_code()
        self.generate_register_code()
        self.save
    end

end
