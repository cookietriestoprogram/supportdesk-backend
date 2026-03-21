class User < ApplicationRecord
    enum role: { user: 0, admin: 1 }
    has_secure_password

    has_many :tickets
    has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assigned_to_id"
end
