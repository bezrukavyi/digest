module MailingLists
  class New < BaseOperation
    attr_env :current_user

    step Model(MailingList, :new)
    step :assign_current_user
    step Contract::Build(constant: Contracts::Create)

    def assign_current_user(*)
      params[:user] = current_user
      success
    end
  end
end
