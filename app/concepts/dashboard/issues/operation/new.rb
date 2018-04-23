module Dashboard::Issues
  class New < BaseOperation
    step Model(Issue, :new)
    step Contract::Build(constant: Contracts::Create)
  end
end
