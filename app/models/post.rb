class Post < ApplicationRecord
    belongs_to :course
    belongs_to :user

    has_many :comments, :dependent => :destroy
end
