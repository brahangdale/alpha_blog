class User < ApplicationRecord

	has_many :articles, dependent: :destroy
	has_one :user_profile, dependent: :destroy
	accepts_nested_attributes_for :user_profile, allow_destroy: true


	before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }

  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 109}

   has_secure_password
end