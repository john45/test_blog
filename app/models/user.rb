# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  before_save { self.email = email.downcase }
  # after_create :welcome_message

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true,
                    length: { minimum: 5, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  acts_as_voter

  def welcome_message
    GreetingMeailerMailer.welcome(email, name).deliver!
  end
end
