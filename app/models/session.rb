class Session < ApplicationRecord
  auditable

  enum status: [:active, :expired]

  belongs_to :user, dependent: :destroy

  before_create :generate_authentication_token
  before_create :set_validity

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
