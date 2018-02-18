module MailingLists
  class Edit < Trailblazer::Operation
    FINDER = ->(*) { MailingLists::Find }

    step Nested(FINDER)
    step Contract::Build(constant: CreateContract)
  end
end
