require 'foreman_plugin_exec_cmd'

module ForemanPluginExecCmd
  #Inherit from the Rails module of the parent app (Foreman), not the plugin.
  #Thus, inherits from ::Rails::Engine and not from Rails::Engine
  class Engine < ::Rails::Engine

	# Include extenstions to models in this config.to_prepare block
    config.to_prepare do
    	  # Example: Include host extenstions
    	  if SETTINGS[:version] > "1.1"
          ::Host::Managed.send :include, ForemanPluginExecCmd::HostExtensions
        else
          ::Host.send :include, ForemanPluginExecCmd::HostExtensions
        end
#        ::UnattendedController.send :include, ForemanPluginExecCmd::UnattendedControllerExtensions
    end
  end
end
