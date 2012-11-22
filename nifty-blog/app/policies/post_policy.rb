class PostPolicy < Struct.new(:user, :post)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(:user_id => user.id)
    end
  end

  def owned
    post.user_id == user.id
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    new?
  end

  def new?
    true
  end

  def update?
    edit?
  end

  def edit?
    owned
  end

  def destroy?
    owned
  end
end
