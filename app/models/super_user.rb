class SuperUser < ApplicationRecord
  attr_accessor :password, :password_confirmation

  before_save :encrypt_password

  validates_confirmation_of :password
  validates :name,          presence: true
  validates :email,         presence: true, uniqueness: true
  validates :password,      presence: true, on: :create

  def as_json(*)
    {
      id: id,
      name: name,
      email: email,
    }
  end

  def authenticate?(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def reset_password
    self.password = rand(100000..999999).to_s
    save(validate: false) ? password : nil
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    true
  end
end
