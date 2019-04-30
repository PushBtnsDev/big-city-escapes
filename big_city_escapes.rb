require 'artii'
require 'colorize'
require_relative 'locations_classes/new_york'
require_relative 'locations_classes/melbourne'
require_relative 'locations_classes/london'
require_relative 'locations_classes/main_classes'


def game_introduction()
    # returns a player object
    # introduces the game and scenario

    # INTRO GEM SCREEN
    puts "\n" * 20
    File.open("text_files/big_city_skyline.txt", "r") do |f|
        f.each_line do |line|
            puts line
        end
    end
    title = Artii::Base.new :font => 'slant'
    puts title.asciify('Big City Escapes!')

    continue = 0
    while continue != 1
        print "Press 1 to begin: "
        continue = gets.strip.to_i()
        puts "\n" * 20
    end

    puts "\n" * 20
    puts "Welcome to Big City Escapes! You are about to embark on a trip to 3 BIG cities! In each city you may get yourself stuck in some situations that you need to escape from.  Follow the prompts to get the best clues on how to escape from each dilemma you face, be careful along the way you may run into a few roadblocks.".yellow + " 

    You will be playing for the ultimate prize of $1 million dollars tax free cash plus a donation of".yellow + " about 3 fiddy ".green + "to a charity of your choice. ".yellow


    continue = 0
    while continue != 1
        print "Press 1 to continue: "
        continue = gets.strip.to_i()
        puts "\n" * 20
    end

    puts "Each player will start with a health of ".yellow + "100 Hearts.".red + " 
    Be sure to keep an eye on your health as you navigate your way through the challenges as your health may be affected at certain roadblocks through this trip.  
    Also for each challenge played you have the chance to win a certain amount of points. 
    The player who finishes the game with the most health and points will win the".yellow + " ultimate prize! ".green

    name = "place_holder"
    while name.length < 0 || name.length > 6
        print "Please enter your name: "
        name = gets.strip
        puts "\n" * 20
    end

    return Player.new(name)
end

def finish_line(player)
    
    puts "Phwoah! What an excellent adventure! Well done, you've made it to the finish line in one piece. Let's see if your final score was enough to clinch that ultimate prize of $1 million dollars! (and about a 3 fiddy donation to a charity of your choice). You will need to be at the top scoring range to bring home the dough."

    continue = 0
    while continue != 1
        print "Press 1 to view the highscore: "
        continue = gets.strip.to_i()
        puts "\n" * 20
    end

    # scoreboard
    set_scoreboard = [["Kevin", 750], ["Suki", 600], ["Jov", 550], ["Jordan", 400], ["Clinton", 50]]

    player_score_block = [player.name, player.score]

    inserted = false
    count = 0
    while count < set_scoreboard.length && !inserted
        if player.score > set_scoreboard[count][1]
            set_scoreboard.insert(count, player_score_block) 
            inserted = true
        end
        count += 1
    end

    if !inserted 
        set_scoreboard << player_score_block
    end
    
    puts set_scoreboard
    if set_scoreboard[0] == player_score_block
        puts "Woohoo! You are the champion! You have won $1 million dollars + a donation of about 3 fiddy to a charity of your choice! Thank you for playing Big City Escapes!"
    else
        puts "Unlucky! You missed that top spot, we will still however give you about a 3 fiddy donation to a charity of your choice! Thank you for playing Big City Escapes!"
    end
end

def finish_line_test
    barry = Player.new("Barry")
    barry.update_score(500)

    # Expect Barry to sit on the scoreboard between Jov and Jordan
    finish_line(barry)
end

def player_is_in_inventory_test()

    player = Player.new("Player")
    player.add_item("Dog")

   
    if player.is_in_inventory?("Dog")
        puts "player_is_in_inventory_test ran as expected"
    else
        puts "player_is_in_inventory_test did not run as expected"
    end

    if player.is_in_inventory?("Cat")
        puts "player_is_in_inventory_test did not run as expected"
    else
        puts "player_is_in_inventory_test ran as expected"
    end
end

def player_change_health_test()
    
    # Initial health = 100
    player = Player.new("Player")

    player.change_health(-25)
    if player.health == 75
        puts "player_change_health_test ran as expected"
    else
        puts "player_change_health_test did not run as expected"
    end

    player.change_health(-25)
    player.change_health(-25)
    if player.change_health(-25) == "Game Over, your journey has come to an end!"
        puts "player_change_health_test ran as expected"
    else
        puts "player_change_health_test did not run as expected"
    end

end

def main_game()
    # Main function

    # introduction
    player = game_introduction()

    dead = false
    # New York
    NewYork.new_york_greeting
    continue = NewYork.boat_escape(player)
    if !continue
        dead = true
    end
        
    if !dead
        NewYork.roadblock1(player)
    end


    # Melbourne
    
    if !dead
        Melbourne.melbourne_greeting
        continue = Melbourne.aus_open_escape(player)
    end
    if !continue
        dead = true
    end

    if !dead
        Melbourne.roadblock2(player)
    end


    # London
    
    if !dead
        London.london_greeting
        continue = London.london_dungeon(player)
    end
    if !continue
        dead = true
    end

    if !dead
        London.roadblock3(player)
    end

    # Outro
    if !dead
        finish_line(player)
        end_message = Artii::Base.new :font => 'slant'
        puts end_message.asciify('You made it!')
    end

    if dead
        File.open("text_files/big_city_skull.txt", "r") do |f|
            f.each_line do |line|
                puts line
            end
        end
        end_message = Artii::Base.new :font => 'slant'
        puts end_message.asciify('Game Over')
    end
end

def main
    puts "\n" * 20

    playing = true
    while playing
        playing = main_game
    end
end

main