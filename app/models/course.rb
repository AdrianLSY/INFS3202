class Course < ApplicationRecord
    validates :code, presence: true, uniqueness: true
    validates_presence_of :name

    has_many :user_courses, dependent: :destroy
    has_many :users, through: :user_courses

    has_many :posts, dependent: :destroy

    def to_s
        return "#{self.code} | #{self.name}"
    end

end
