module Mutations
  class UpdateTicket < BaseMutation
    argument :id, ID, required: true
    argument :subject, String, required: false
    argument :description, String, required: false
    argument :priority, String, required: false
    argument :status, String, required: false
    argument :category, String, required: false
    argument :assigned_to_id, ID, required: false

    field :ticket, Types::TicketType, null: true

    def resolve(id:, **args)
      user = context[:current_user]
      ticket = Ticket.find(id)

      unless user.admin? || ticket.user == user
        raise "Unauthorized"
      end

      if user.admin?
        allowed_fields = args.slice(:status, :assigned_to_id)
        if allowed_fields.empty?
          raise "Admins can only update status or assignment"
        end
        ticket.update!(allowed_fields)
      else
        unless ticket.open?
          raise "Edit only open tickets"
        end
        ticket.update!(args)
      end 

      { ticket: ticket }
    end
  end
end