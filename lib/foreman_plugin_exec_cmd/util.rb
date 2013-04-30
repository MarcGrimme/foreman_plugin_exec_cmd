require 'open3'

module ForemanPluginExecCmd::Util
  extend ActiveSupport::Concern
  included do
    class_eval do
      def exec_cmd_object
        if not params or not params['action']
          message = "Host no action"
        elsif params['action'] == 'built'
          message = "Host build complete"
        else
          message = "#{params['action'].capitalize} template requested"
        end
        if SETTINGS[:pluginExecCmd] and SETTINGS[:pluginExecCmd][:enabled]
          cmd=(params['action'] && SETTINGS[:pluginExecCmd][params['action']]) || SETTINGS[:pluginExecCmd][:cmd] || "cat"
          logger.debug "ForemanPluginExecCmd: Eval cmd #{cmd}"
          cmd=eval %Q|"#{cmd}"|
          logger.debug "ForemanPluginExecCmd: Executing cmd #{cmd}"
          if (params['action'] and SETTINGS[:pluginExecCmd][params['action']+"_aspipe"]) or SETTINGS[:pluginExecCmd][:aspipe] then
            pipecmd=(params['action'] and SETTINGS[:pluginExecCmd][params['action']+"_aspipe"]) || SETTINGS[:pluginExecCmd][:aspipe]
            out, err=exec_cmd_aspipe(cmd, pipecmd)
          else
            out, err=exec_cmd(cmd)
          end
        end
      end
      def exec_cmd_aspipe(cmd, pipecmd)
        out, err, status = Open3.popen3(cmd) do |stdin,stdout,stderr|
           if pipecmd.is_a? String
             logger.debug "ForemanPluginExecCmd: exec_cmd_aspipe #{pipecmd}"
             stdin.write(eval %Q|#{pipecmd}|)
           elsif (self.type = "Host::Managed" or self.type = "Host") and pipecmd == true then
             stdin.write(self.to_yaml)
           elsif pipecmd == true
             stdin.write(@host.to_yaml)
           end
           stdin.close
           # we could still deadlock here, it'd ideally select() on stdout+err
           out = stdout.read
           err = stderr.read
           [ out, err, $? ]
        end
        raise "ForemanPluginExecCmd: Could not execute command #{cmd}. Error: #{err}, Output: #{out}, Status: #{status}" unless status.to_i == 0
        [out, err]
      end
      def exec_cmd(cmd)
          stdin, stdout, stderr = Open3.popen3(cmd)
          out=stdout.gets
          err=stdout.gets
          raise "ForemanPluginExecCmd: Could not execute command #{cmd}. Error: #{err}, Output: #{out}" unless $?.to_i == 0    
          [ out, err ]
      end
      
      def logger; Rails.logger; end
    end
  end
end