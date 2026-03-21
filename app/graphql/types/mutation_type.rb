# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_ticket, mutation: Mutations::CreateTicket
    field :update_ticket, mutation: Mutations::UpdateTicket
    field :delete_ticket, mutation: Mutations::DeleteTicket
    field :login, mutation: Mutations::Login
  end
end
