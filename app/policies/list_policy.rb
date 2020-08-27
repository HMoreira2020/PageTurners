class ListPolicy < ApplicationPolicy
    attr_reader :user, :list
  
    def initialize(user, list)
      @user = user
      @list = list
    end
  
    def update?
      list.user == user
    end

    def destroy?
      list.user == user
    end
  end