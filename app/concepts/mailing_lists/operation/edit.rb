module MailingLists
  class Edit < BaseOperation
    FINDER = ->(*) { MailingLists::Find }

    step Nested(FINDER)
    step Policy::Pundit(BasePolicy, :edit?)
    step Contract::Build(constant: Contracts::Create)
  end
end
