# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin = User.create!(
  email: 'admin@email.com',
  password: 'password',
  name: 'Admin Juan',
  role: 'admin'
)

user1 = User.create!(
  email: 'user1@email.com',
  password: 'password',
  name: 'Test User1',
  role: 'user'
)

user2 = User.create!(
  email: 'user2@email.com',
  password: 'password',
  name: 'Test User2',
  role: 'user'
)

Ticket.create!([
  {
    subject: 'Cannot access email',
    category: 'technical',
    description: 'I cannot log into my email account',
    status: 'open',
    priority: 'high',
    user: user1
  },
  {
    subject: 'Need password reset',
    category: 'account',
    description: 'Pls reset my password',
    status: 'in_progress',
    priority: 'medium',
    user: user2,
    assigned_to: admin
  },
  {
    subject: 'Gcash connection error',
    category: 'billing',
    description: 'Gcash payments are not following through',
    status: 'resolved',
    priority: 'urgent',
    user: user1,
    assigned_to: admin
  }
])

puts "Database seeded!"