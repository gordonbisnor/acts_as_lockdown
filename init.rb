# Include hook code here
require 'acts_as_lockdown'
ActiveRecord::Base.send(:include, Isnor::Acts::Lockdown)
