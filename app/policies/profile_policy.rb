# frozen_string_literal: true

class ProfilePolicy
  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    if @user.profile.nil?
      true
    else
      false
    end
  end

  def new?
    create?
  end

  def update?
    raise
    if @user.id == @profile.user_id
      return true
    else
      return false
    end
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def delete?
    update?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
