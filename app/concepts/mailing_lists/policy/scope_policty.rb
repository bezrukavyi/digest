module MailingLists
  class ScopePolicy
    attr_reader :user, :scope

    def initialize(user, scope = MailingList)
      @user = user
      @scope = scope
    end

    def index
      scope.where(user: user)
    end
  end
end
