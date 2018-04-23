module MailingLists
  class Find < BaseOperation
    step Rescue(ActiveRecord::RecordNotFound) { step :model! }

    def model!(*)
      id = env[:id] || params[:id] || params[:mailing_list_id]
      self.model = MailingList.friendly.find(id)
    end
  end
end
