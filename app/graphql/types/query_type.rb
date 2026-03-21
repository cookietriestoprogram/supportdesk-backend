# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    field :tickets, [Types::TicketType], null: false

    def tickets
      if context[:current_user].admin?
        Ticket.all
      else
        context[:current_user].tickets
      end
    end
   
  end
end
