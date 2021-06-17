# frozen_string_literal: true

module TestPasswordHelper
  def default_password_encrypted
    Devise::Encryptor.digest(User, 'password')
  end

  def default_password
    'password'
  end
end
