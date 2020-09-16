class Post < ActiveRecord::Base
    belongs_to :user

    validates :topic, :content, presence: true
end
