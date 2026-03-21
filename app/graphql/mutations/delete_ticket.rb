module Mutations
  class DeleteTicket < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      user = context[:current_user]
      ticket = Ticket.find(id)

      raise "Unauthorized" unless user.admin? || ticket.user == user 

      ticket.destroy
      { success: true }
    end
  end
end