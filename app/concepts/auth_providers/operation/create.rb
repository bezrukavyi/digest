module AuthProviders
  class Create < BaseOperation
    attr_env :current_user

    step :adopt_params
    step Model(AuthProvider, :new)
    step Contract::Build(constant: CreateContract)
    step Contract::Validate()
    step Contract::Persist()

    def adopt_params(*)
      params[:resource] ||= current_user
      params[:name] ||= params[:provider]
    end
  end
end
