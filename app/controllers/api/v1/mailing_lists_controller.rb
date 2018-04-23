module Api::V1
  class MailingListsController < Api::V1::ApplicationController
    def show
      @result = MailingLists::Find.call(params: params)
      respond_to_result serializer: MailingLists::EntitySerializer, include: [:last_issue]
    end
  end
end
