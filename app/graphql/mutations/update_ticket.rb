module Mutations
  class UpdateTicket < BaseMutation
    argument :id, ID, required: true
    argument :subject, String, required: false
    argument :description, String, required: false
    argument :priority, String, required: false
    argument :status, String, required: false
    argument :assigned_to_id, ID, required: false

    field :ticket, Types::TicketType, null: true

    def resolve(id:, **args)
      user = context[:current_user]
      ticket = Ticket.find(id)

      unless user.admin? || ticket.user == user
        raise "Unauthorized"
      end

      ticket.update!(args)
      { ticket: ticket }
    end
  end
end