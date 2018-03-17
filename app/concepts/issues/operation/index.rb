module Issues
  class Index < Trailblazer::Operation
    extend Representer::DSL

    step Policy::Guard(:find_mailing_list)
    step :load_issues
    representer :render, IssuesRepresenter

    def load_issues(env, **)
      env[:model] = env[:mailing_list].issues
    end


    def find_mailing_list(env, **)
      env[:mailing_list] = MailingList.find_by(slug: env[:mailing_list_id])
      env[:mailing_list].user == env[:current_user]
    end
  end
end
