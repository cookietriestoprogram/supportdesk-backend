module Types
  class TicketType < Types::BaseObject
    field :id, ID, null: false
    field :subject, String, null: false
    field :description, String, null: false
    field :status, String, null: false
    field :priority, String, null: false
    field :category, String, null: false
    field :user, Types::UserType, null: false
    field :assigned_to, Types::UserType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end