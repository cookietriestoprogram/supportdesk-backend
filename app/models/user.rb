class User < ApplicationRecord
    enum :role, { user: 0, admin: 1 }
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    has_many :tickets
    has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assigned_to"

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
end
