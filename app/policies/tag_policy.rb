class TagPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def tag_things?
    true
  end

end
