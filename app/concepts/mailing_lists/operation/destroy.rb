module MailingLists
  class Destroy < BaseOperation
    FINDER = ->(*) { MailingLists::Find }

    step Nested(FINDER)
    step Policy::Pundit(BasePolicy, :destroy?)
    step :destroy

    def destroy(*)
      model.destroy
    end
  end
end
