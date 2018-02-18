module MailingLists
  class Find < Trailblazer::Operation
    step Rescue(ActiveRecord::RecordNotFound) {
      step :model!
    }

    def model!(env, params:, **)
      env[:model] = MailingList.friendly.find(params[:id] || env[:id])
    end
  end
end
