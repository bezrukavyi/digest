module MailingLists
  class New < Trailblazer::Operation
    step Model(MailingList, :new)
    step :assign_current_user
    step Contract::Build(constant: CreateContract)

    def assign_current_user(env, params:, **)
      params[:user] = env[:current_user]
      true
    end
  end
end
