class BookPolicy < ApplicationPolicy
    attr_reader :user, :book
  
    def initialize(user, book)
      @user = user
      @book = book
    end
  
    def update?
      user.admin? 
    end

    def destroy?
      user.admin?
    end
  end