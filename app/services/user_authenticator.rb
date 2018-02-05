class UserAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticate(unencrypted_password)
    @user.encrypted_password  == encrypt(unencrypted_password)
  end

  def encrypt(unencrypted_password)
    BCrypt::Engine.hash_secret(unencrypted_password, @user.salt)
  end
end