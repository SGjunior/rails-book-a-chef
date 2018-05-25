class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  def new?
    #some condition
    true
  end

  def create?
    #some condition
    true
  end

  def edit?
    #some condition
    # record # === @listing
    # user   # === current_user
    # @restaurant.user == current_user
    record.user_id == user.id
  end

  def update?
    #some condition
    record.user_id == user.id
  end

  def destroy?
    #some condition
    record.user_id == user.id
  end

end
