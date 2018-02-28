module MailingLists
  class Update < Trailblazer::Operation
    PRESENT = ->(*) { MailingLists::Edit }

    step Nested(PRESENT)
    step Policy::Pundit(BasePolicy, :update?)
    step Contract::Validate()
    step Contract::Persist()
  end
end
