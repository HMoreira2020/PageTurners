class BookPolicy < ApplicationPolicy
    attr_reader :user, :book
  
    def initialize(user, book)
      @user = user
      @book = book
    end
    
    def new? 
      user.admin? 
    end 

    def create? 
      user.admin? 
    end 

    def edit?
      user.admin? 
    end 

    def update?
      user.admin? 
    end

    def destroy?
      user.admin?
    end
  end