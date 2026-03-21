class User < ApplicationRecord
    enum :role, { user: 0, admin: 1 }
    has_secure_password

    has_many :tickets
    has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assigned_to"

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }, on: :create
end
