module Mutations
  class Register < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :name, String, required: true
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :token, String, null: true
    field :errors, [String], null: false

    def resolve(name:, email:, password:, role: "user")
      user = User.new(name: name, email: email, password: password, role: role)

      if user.save
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
        {
          user: user,
          token: token,
          errors: []
        }
      else
        {
          user: nil,
          token: nil,
          errors: 'Registration failed'
        }
      end
    end
  end
end