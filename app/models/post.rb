class Post < ApplicationRecord
    validates_presence_of :title, :body

    belongs_to :course
    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :awards, dependent: :destroy
end
