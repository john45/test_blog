class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  before_save :after_registration_send_email

  private

    def after_registration_send_email
      GreetingMeailerMailer.after_registration(self.user).deliver_now
    end
end
