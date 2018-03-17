module AuthProviders
  class Identify < Trailblazer::Operation
    CREATE = ->(*) { AuthProviders::Create }

    step :find_provider, pass_fast: true
    fail :find_user, Output(:success) => :success
    fail :create_user, Output(:success) => :success, fail_fast: true
    step :confirm_user
    step Nested(CREATE)

    def find_provider(env, params:, **)
      env[:model] = AuthProvider.find_by(name: params[:provider], uid: params[:uid])
      env[:model].present?
    end

    def find_user(env, params:, **)
      env[:current_user] = User.find_by(email: params.dig(:info, :email))
      env[:current_user].present?
    end

    def create_user(env, params:, **)
      user_params = params[:info].merge(random_password)
      env[:current_user] = Users::Create.call(params: user_params)[:model]
      env[:current_user].persisted?
    end

    def confirm_user(env, params:, **)
      return true if env[:current_user].confirmed?
      env[:current_user].confirm
    end

    private

    def random_password
      password = SecureRandom.urlsafe_base64(nil, false)
      { password: password, password_confirmation: password }
    end
  end
end
