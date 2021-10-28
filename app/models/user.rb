class User < ApplicationRecord
  GENDERS = [
    MALE = 0,
    FEMALE = 1
  ].freeze

  validates :name,          presence: true
  validates :email,         presence: true, uniqueness: true
  validates :gender,        presence: true, inclusion: { in: User::GENDERS }
end
