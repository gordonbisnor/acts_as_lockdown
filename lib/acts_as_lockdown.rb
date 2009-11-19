# ActsAsLockdown
module Isnor
  module Acts #:nodoc:
    module Lockdown #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_lockdown
          include Isnor::Acts::Lockdown::InstanceMethods
          extend Isnor::Acts::Lockdown::SingletonMethods
        end
        
            # Add instance methods here
            def lockdown state, *fields
              fields.each do |field|
                define_method("#{ field }=") do |value|
                  unless self.send("#{state}?")
                    self.write_attribute(field, value) 
                  end
                end
              end
            end # END ACTS AS LOCKDOWN
        
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
    
      end # END INSTANCE METHODS MODULE
      
    end # END LOCKDOWN MODULE
  end # END ACTS MODULE
end # END ISNOR MODULE