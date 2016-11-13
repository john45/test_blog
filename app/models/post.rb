class Post < ApplicationRecord
  # scope :lenght_title, where('title').count > 3
  belongs_to :user

end
