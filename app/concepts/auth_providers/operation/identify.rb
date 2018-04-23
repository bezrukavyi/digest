module AuthProviders
  class Identify < BaseOperation
    attr_env :current_user

    CREATE = ->(*) { AuthProviders::Create }

    step :find_provider, pass_fast: true
    fail :find_or_create_user, Output(:success) => :success
    step :confirm_user
    step Nested(CREATE)

    def find_provider(*)
      self.model = AuthProvider.find_by(name: params[:provider], uid: params[:uid])
      model.present?
    end

    def find_or_create_user(*)
      self.current_user = User.find_by(email: params.dig(:info, :email))
      return success if current_user.present?
      self.current_user = Users::Create.call(params: user_create_params)[:model]
      current_user.persisted?
    end

    def confirm_user(*)
      return true if current_user.confirmed?
      current_user.confirm
    end

    private

    def user_create_params
      password = SecureRandom.urlsafe_base64(nil, false)
      params[:info].merge(password: password, password_confirmation: password)
    end
  end
end
