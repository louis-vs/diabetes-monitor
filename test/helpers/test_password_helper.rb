# frozen_string_literal: true

module TestPasswordHelper
  def default_password_encrypted
    User.new.send(:password_digest, default_password)
  end

  def default_password
    'password'
  end
end
