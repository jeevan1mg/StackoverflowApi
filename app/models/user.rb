class User < ApplicationRecord
  auditable
  preservable

  has_many :sessions
  has_many :questions
  has_one  :user_profile
  has_and_belongs_to_many :badges
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_name, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true
  validates_length_of :password, in: 6..20, on: :create

  before_create  :encrypt_password
  after_create   :delete_password

  private

  def encrypt_password
    return unless password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end

  def delete_password
    self.password = nil
  end

end
