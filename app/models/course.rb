class Course < ApplicationRecord
    validates :code, presence: true, uniqueness: true
    validates_presence_of :name

    has_many :posts, dependent: :destroy
    has_many :users, through: :user_courses

end
