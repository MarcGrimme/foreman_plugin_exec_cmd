require 'foreman_plugin_exec_cmd/util'
# Ensure that module is namespaced with plugin name
module ForemanPluginExecCmd
	# Example: Create new instance and class methods on Foreman's Host model
	module HostExtensions
	 	extend ActiveSupport::Concern
    include ForemanPluginExecCmd::Util

	  included do
	# 	  execute standard callbacks
	# 	  after_create :do_this
	# 	  after_destroy :do_that

	# 	  execute custom hooks
	     logger.debug "ForemanPluginExecCmd: Including into Host"
	     after_create :exec_cmd_object
	     after_build :exec_cmd_object
       before_provision :exec_cmd_object
    end

  def renderTemplate
    @host = self
    render_safe configTemplate.template
  end
	# 	# create new method
	#   def new_instance_method
	#   end
	#   # or overwrite existing method
	#   def existing_method_name
	#   end

	#   module ClassMethods
	# 		# create new class method
	# 	  # ...
	# 	end

	end
end
