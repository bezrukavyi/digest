module Api::V1::Dashboard
  class MailingListsController < Api::V1::Dashboard::ApplicationController
    def show
      @result = MailingLists::Find.call(options)
      respond_to_result serializer: Dashboard::MailingLists::EntitySerializer
    end

    def index
      @collection = MailingLists::ScopePolicy.new(current_user).index
      respond_with Dashboard::MailingLists::CollectionSerializer.new(@collection).serialized_json
    end

    def create
      @result = MailingLists::Create.call(options.merge(params: permit_params))
      respond_to_result serializer: Dashboard::MailingLists::EntitySerializer
    end

    def update
      @result = MailingLists::Update.call(options.merge(params: permit_params))
      binding.pry
      respond_to_result serializer: Dashboard::MailingLists::EntitySerializer
    end

    def destroy
      @result = MailingLists::Destroy.call(options)
      respond_to_result
    end

    private

    def options
      {
        id: params[:id],
        params: {},
        current_user: current_user
      }
    end

    def permit_params
      params.permit(:name, :description, :slug)
    end
  end
end
