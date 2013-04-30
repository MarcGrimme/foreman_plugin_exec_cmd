require 'foreman_plugin_exec_cmd/util'
# Ensure that module is namespaced with plugin name
module ForemanPluginExecCmd

# ForemanPluginExecCmd::UnattendedControllerExtensions

  # Example: Plugin's HostsController inherits from Foreman's HostsController
  # class HostsController < ::HostsController

    # change layout if
    # layout 'foreman_plugin_template/layouts/new_layout'

  #  def new_action
      # automatically renders view/foreman_plugin_template/hosts/new_action
	#  end

  # end
  module UnattendedControllerExtensions
    extend ActiveSupport::Concern
    include ForemanPluginExecCmd::Util

    included do
      logger.debug "ForemanPluginExecCmd: including into UnattendedControllerExtension"
      after_filter :exec_cmd_object, :only => [:provision,:finish,:built,:create,:update,:destroy]
    end
  end

end
