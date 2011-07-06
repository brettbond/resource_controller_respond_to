# ResouceControllerRespondTo
# see explanation from http://groups.google.com/group/resource_controller/browse_thread/thread/ec9100db655bc5a9
#
module ResourceControllerRespondTo
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      class << self        
        alias_method_chain :init_default_actions, :json
        alias_method_chain :init_default_actions, :xml
      end
    end
  end
  
  module ClassMethods
    def init_default_actions_with_json(klass)
      init_default_actions_without_json(klass)
      klass.class_eval do
        index.wants.json { render :json => collection, :status => :ok }
        show.wants.json  { render :json => object }
        
        update.wants.json { head :accepted }
        
        create.wants.xml { redirect_to object,  :status => :created }
        destroy.wants.xml { redirect_to collection, :status => :accepted }
        
        for action in [create, update]
          action.failure.wants.json { render :json => object.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    
    def init_default_actions_with_xml(klass)
      init_default_actions_without_xml(klass)
      klass.class_eval do
        index.wants.xml { render :xml => collection, :status => :ok }
        show.wants.xml  { render :xml => object }
        
        create.wants.xml { redirect_to object,  :status => :created }
        destroy.wants.xml { redirect_to collection, :status => :accepted }
        
        update.wants.xml { head :accepted }
        
        for action in [create, update]
          action.failure.wants.xml { render :xml => object.errors, :status => :unprocessable_entity }
        end
      end
    end
    
  end
end

ResourcesController::Controller.send :include, ResourceControllerRespondTo

