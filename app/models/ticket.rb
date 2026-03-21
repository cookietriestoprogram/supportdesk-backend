class Ticket < ApplicationRecord
  enum :status, { open: 0, in_progress: 1, resolved: 2, closed: 3 }
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }
  enum :category, { technical: 0, account: 1, billing: 2, bug: 3, other: 4 }

  belongs_to :user
  belongs_to :assigned_to, class_name: "User", optional: true

  validates :subject, :description, presence: true
end
