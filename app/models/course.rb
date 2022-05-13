class Course < ApplicationRecord
    has_many :posts, dependent: :destroy

    has_many :users, through: :user_courses

end
