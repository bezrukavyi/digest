module MailingLists
  class Find < Trailblazer::Operation
    step Rescue(ActiveRecord::RecordNotFound) {
      step :model!
    }
    step Policy::Pundit(BasePolicy, :show?)

    def model!(env, params:, **)
      env[:model] = MailingList.friendly.find(env[:id] || params[:id])
    end
  end
end
