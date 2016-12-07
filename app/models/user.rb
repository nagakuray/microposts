class User < ActiveRecord::Base
	include JpPrefecture
  jp_prefecture :birthplace

  before_save { self.email = self.email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	# VALID_BIRTHDAY_REGEX = /\d{4}-\d{2}-\d{2}/
  validates :birthday, presence: false, length: { maximum: 10 }

  has_secure_password
end