module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      user = User.find_by(email: email)

      raise "Invalid credentials" unless user&.authenticate(password)

      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)

      { user: user, token: token }
    end
  end
end