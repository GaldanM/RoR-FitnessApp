class Admin < ApplicationRecord
  before_save { self.login = login.downcase }

  validates  :login,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { maximum: 20 }

  validates :password,
            presence: true,
            length: { minimum: 5 }
  has_secure_password
end
