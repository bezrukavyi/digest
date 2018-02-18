module MailingLists
  class New < Trailblazer::Operation
    step Model(MailingList, :new)
    step Contract::Build(constant: CreateContract)
  end
end
