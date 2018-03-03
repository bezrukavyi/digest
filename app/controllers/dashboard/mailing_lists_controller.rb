module Dashboard
  class MailingListsController < Dashboard::ApplicationController
    def show
      @result = MailingLists::Find.call(options)
      respond_to_result do |on|
        on.success { render :show }
        on.failure { redirect_to '/' }
      end
    end

    def index
      @collection = MailingLists::ScopePolicy.new(current_user).index
    end

    def new
      @result = MailingLists::New.call(options)
      respond_to_result do |on|
        on.success { render :new }
        on.failure { redirect_to '/' }
      end
    end

    def create
      @result = MailingLists::Create.call(options)
      respond_to_result do |on|
        on.success { redirect_to [:dashboard, @model] }
        on.failure { render :new }
      end
    end

    def edit
      @result = MailingLists::Edit.call(options)
      respond_to_result do |on|
        on.success { render :edit }
        on.failure { redirect_to '/' }
      end
    end

    def update
      @result = MailingLists::Update.call(options)
      respond_to_result do |on|
        on.success { redirect_to [:dashboard, @model] }
        on.failure { render :edit }
      end
    end

    def destroy
      @result = MailingLists::Destroy.call(options)
      respond_to_result do |on|
        on.success { redirect_to dashboard_mailing_lists_path }
        on.failure(:invalid) { redirect_to [:dashboard, @model] }
      end
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
