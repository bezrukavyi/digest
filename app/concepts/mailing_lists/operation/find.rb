module MailingLists
  class Find < Trailblazer::Operation
    step Rescue(ActiveRecord::RecordNotFound) {
      step :model!
    }
    step Policy::Pundit(BasePolicy, :show?)

    def model!(env, params:, **)
      env[:model] = MailingList.friendly.find(params[:id] || env[:id])
    end
  end
end
