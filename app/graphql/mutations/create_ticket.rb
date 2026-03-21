module Mutations
  class CreateTicket < BaseMutation
    argument :subject, String, required: true
    argument :description, String, required: true
    argument :priority, String, required: true
    argument :category, String, required: true

    field :ticket, Types::TicketType, null: true

    def resolve(**args)
      ticket = context[:current_user].tickets.create!(
        args.merge(status: "open")
      )
      { ticket: ticket }
    end
  end
end