class Session < ApplicationRecord
  auditable

  belongs_to :user, dependent: :destroy, autosave: true

  validates_presence_of :user

  before_create :generate_authentication_token, :set_validity

  enum status: [:active, :expired]

  def generate_authentication_token
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_validity
    self.valid_till = Time.now + 10.hours
  end

  def expire
    self.expired_at = Time.now
    self.expired!
  end
end
