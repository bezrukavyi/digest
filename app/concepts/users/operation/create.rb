module Users
  class Create < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Contracts::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
