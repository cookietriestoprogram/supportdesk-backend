# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    # get all tickets based on role
    field :tickets, [Types::TicketType], null: false

    # get tickets with filtering
    field :tickets, [Types::TicketType], null: false do
      argument :status, String, required: false
      argument :priority, String, required: false
      argument :category, String, required: false
    end

    # get dashboard stats (admin only)
    field :dashboard_stats, Types::DashboardStatsType, null: false

    # get a single ticket for a user
    field :ticket, Types::TicketType, null: true do
      argument :id, ID, required: true
    end

    def ticket(id:)
      ticket = Ticket.find(id)
      current_user = context[:current_user]
      return nil unless current_user.admin? || ticket.user == user
      ticket
    end


    def dashboard_stats
      return nil unless context[:current_user]&.admin?
      {
        total: Ticket.count,
        open: Ticket.open.count,
        resolved: Ticket.resolved.count,
        high_priority: Ticket.high.count
      }
    end

    def tickets(status: nil, priority: nil, category: nil)
      scope = context[:current_user].admin? ? Ticket.all : context[:current_user].tickets
      
      scope = scope.where(status: status) if status
      scope = scope.where(priority: priority) if priority
      scope = scope.where(category: category) if category
      
      scope
    end

    def tickets
      if context[:current_user].admin?
        Ticket.all
      else
        context[:current_user].tickets
      end
    end
   
  end
end
