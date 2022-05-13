class Post < ApplicationRecord
    belongs_to :course
    belongs_to :user

    has_many :comments, :as => :commentable, :dependent => :destroy
end