#!/usr/bin/env ruby
username = ARGV[0].strip

config_template = File.read("template.rc")
File.open("#{username}.rc", "w") do |f|
  f.print config_template.gsub("$user", username)
end

%x{mkdir -p #{username}}
exec("mbsync -c #{username}.rc archive")
