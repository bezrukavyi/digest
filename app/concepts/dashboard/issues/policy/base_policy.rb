module Dashboard::Issues
  class BasePolicy
    attr_reader :user, :model

    def initialize(user, model)
      @user = user
      @model = model
    end

    def show?
      same_user?
    end

    def create?
      user.present?
    end

    private

    def same_user?
      user.present? && user == model.user
    end
  end
end
