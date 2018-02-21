module Users
  class Create < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: CreateContract)
    step Contract::Validate()
    step Contract::Persist()
  end
end
