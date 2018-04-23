module MailingLists
  class Create < BaseOperation
    PRESENT = ->(*) { MailingLists::New }

    step Nested(PRESENT)
    step Policy::Pundit(BasePolicy, :create?)
    step Contract::Validate()
    step Contract::Persist()
  end
end
