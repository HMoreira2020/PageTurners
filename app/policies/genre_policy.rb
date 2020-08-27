class GenrePolicy < ApplicationPolicy
    attr_reader :user, :genre
  
    def initialize(user, genre)
      @user = user
      @genre = genre
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