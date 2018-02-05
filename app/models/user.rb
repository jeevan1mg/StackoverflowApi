class User < ApplicationRecord
  auditable
  hard_deletable
  soft_deletable

  has_many :sessions
  has_one  :user_profile
  has_and_belongs_to_many :badges
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create

  before_save  :encrypt_password
  after_save   :delete_password

  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def delete_password
    self.password = nil
  end

end
