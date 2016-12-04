# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # has_ancestry
end
