module Dashboard
  class MailingListsController < ApplicationController
    def show
      result = MailingLists::Find.call(options)
      @model = result[:model]

      result_match.call(result) do |on|
        on.success { render :show }
        on.failure { redirect_to '/' }
      end
    end

    def index
      @collection = MailingList.all
    end

    def new
      result = MailingLists::New.call(options)
      define_model_form(result)

      result_match.call(result) do |on|
        on.success { render :new }
        on.failure { redirect_to '/' }
      end
    end

    def create
      result = MailingLists::Create.call(options)
      define_model_form(result)

      result_match.call(result) do |on|
        on.success { redirect_to [:dashboard, @model] }
        on.failure { render :new }
      end
    end

    def edit
      result = MailingLists::Edit.call(options)
      define_model_form(result)

      result_match.call(result) do |on|
        on.success { render :edit }
        on.failure { redirect_to '/' }
      end
    end

    def update
      result = MailingLists::Update.call(options)
      define_model_form(result)

      result_match.call(result) do |on|
        on.success { redirect_to [:dashboard, @model] }
        on.failure { render :edit }
      end
    end

    def destroy
      result = MailingLists::Destroy.call(options)

      result_match.call(result) do |on|
        on.success { redirect_to dashboard_mailing_lists_path }
        on.failure(:invalid) { redirect_to [:dashboard, @model] }
        on.failure(:not_found) { redirect_to dashboard_mailing_lists_path }
        on.failure { redirect_to '/' }
      end
    end

    private

    def options
      {
        id: params[:id],
        params: params[:mailing_list] || {}
      }
    end
  end
end
