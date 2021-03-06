class ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @record = record
    end
  
    def index?
      false
    end
  
    def show?
      scope.where(:id => record.id).exists?
    end

  
 
  
    class Scope
      
    end
  end