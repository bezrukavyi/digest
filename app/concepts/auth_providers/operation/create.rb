module AuthProviders
  class Create < Trailblazer::Operation
    step :adopt_params
    step Model(AuthProvider, :new)
    step Contract::Build(constant: CreateContract)
    step Contract::Validate()
    step Contract::Persist()

    def adopt_params(env, params:, **)
      params[:resource] ||= env[:current_user]
      params[:name] ||= params[:provider]
    end
  end
end
