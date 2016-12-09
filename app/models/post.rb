# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  image      :string
#

class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 3}
  default_scope -> {order(created_at: :desc)}

  mount_uploader :image, PostImageUploader

  def to_param
    "#{id} #{title}".parameterize
  end

end
