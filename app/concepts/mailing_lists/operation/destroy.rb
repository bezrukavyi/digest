module MailingLists
  class Destroy < Trailblazer::Operation
    FINDER = ->(*) { MailingLists::Find }

    step Nested(FINDER)
    step :destroy

    def destroy(env, **)
      env[:model].destroy
    end
  end
end
