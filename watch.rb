require 'rubygems'
require 'listen'

commands = [
  { :tell => "Google Chrome", :to => "activate" },
  { :tell => "System Events", :to => "keystroke \"r\" using command down" },
  { :tell => "Sublime Text 2", :to => "activate" }
]

dir = Dir.pwd
Listen.to(dir) do |modified, added, removed|
    commands.each do |command|
      %x[osascript -e 'tell application "#{command[:tell]}" to #{command[:to]}']
    end 
end 