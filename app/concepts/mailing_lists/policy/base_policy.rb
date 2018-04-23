module MailingLists
  class BasePolicy
    attr_reader :user, :model

    def initialize(user, model)
      @user = user
      @model = model
    end

    def destroy?
      same_user?
    end

    def show?
      same_user?
    end

    def edit?
      same_user?
    end

    def create?
      user.present?
    end

    def update?
      same_user?
    end

    private

    def same_user?
      user.present? && user == model.user
    end
  end
end
