module Api::V1::Dashboard
  class MailingListsController < Api::V1::ApplicationController
    def show
      @result = MailingLists::Find.call(options)
      respond_to_result
    end

    def index
      @collection = MailingLists::ScopePolicy.new(current_user).index
      respond_with @collection
    end

    def new
      @result = MailingLists::New.call(options)
      respond_to_result
    end

    def create
      @result = MailingLists::Create.call(options)
      respond_to_result
    end

    def edit
      @result = MailingLists::Edit.call(options)
      respond_to_result
    end

    def update
      @result = MailingLists::Update.call(options)
      respond_to_result
    end

    def destroy
      @result = MailingLists::Destroy.call(options)
      respond_to_result
    end

    private

    def options
      {
        id: params[:id],
        params: params[:mailing_list] || {},
        current_user: current_user
      }
    end
  end
end
