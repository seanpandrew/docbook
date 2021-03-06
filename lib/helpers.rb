module Helpers
  require 'erb'
  require 'open3'

  def windows?
    RUBY_PLATFORM.downcase.include?("win32") || RUBY_PLATFORM.downcase.include?("mingw") 
  end
  
  def run_command(command)
    OUTPUT.say_debug "-------------------------"
    OUTPUT.say_debug "Running command: "
    OUTPUT.say_debug command
    OUTPUT.say_debug "-------------------------"
    
    # FIXME: This blocks hard on large books. I don't know how to fix this so I am discarding STDERR
    # out = ""
    # err = ""
    # 
    # Open3.popen3(command) do |stdin, stdout, stderr|
    #   out = stdout.readlines.join
    #   err = stderr.readlines.join
    # end
    # OUTPUT.say out
    # OUTPUT.error err
    
    out = `#{command} 2>&1`
    OUTPUT.say out
    out
  end
  
  def mkdir_p(src, options = {})
    FileUtils.mkdir_p(src)
    OUTPUT.say " - #{src}"
  end
  
  def cp_r(src, dest, options = {})
    FileUtils.cp_r src, dest
    OUTPUT.say " - #{dest}"
  end
  
  def cp(src, dest, options = {})
    FileUtils.cp src, dest
    OUTPUT.say " - #{dest}"
  end
  
  
    # Reads a template from the file system,
    # evaluates it with ERB
    # places it in the output folder specified.
    # Takes the binding context as the last parameter
    # so that ERb has access to instance variables, etc.
    # This works similar to how Rails and Sinatra templates
    # work.
    def render_template_to_file(template, file, context)
      t = File.read(File.join(template))
      File.open(file, "w") do |f|
        f << ERB.new(t, nil, "-").result(context)
      end
    end
  
end