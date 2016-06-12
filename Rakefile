require_relative "lib/creature_actions"
require_relative "lib/creature"
require_relative "lib/foes"
require_relative "lib/rabbit"

task :default => :play

desc "Play a Game of Dwemthy's Array"
task :play do
  rabbit = Rabbit.new
  monkey = IndustrialRaverMonkey.new
  angel = DwarvenAngel.new
  ombudsman = AssistantViceTentacleAndOmbudsman.new
  deer = TeethDeer.new
  cyclist = IntrepidDecomposedCyclist.new
  dragon = Dragon.new
  dwary = [monkey, angel, ombudsman, deer, cyclist, dragon]
  puts "Starting a new game. Let's begin..."
  puts "[Get ready. #{ dwary.first.class } has emerged.]"
  loop do
    if dwary.length == 0
      puts "You decimated Dwemthy's Array! Congratulations!"
    elsif dwary.first.life <= 0
      puts "You defeated the #{ dwary.first.class }!"
      dwary.shift
      puts "[Get ready. #{ dwary.first.class } has emerged.]"
    end
    print ">> "
    player_input = gets
    begin
      puts  "=> " + eval( player_input ).inspect
    rescue
      puts  "=> Invalid Input!"
    end
  end
end