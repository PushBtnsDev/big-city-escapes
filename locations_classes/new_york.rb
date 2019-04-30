require_relative 'main_classes'

module NewYork

    class TheBoat < EscapeRoom

        def print_north_direction
            if self.is_in_items?("Bird Seed")
                bird_string = "a bag of bird seed and "
            else 
                bird_string = ""
            end
    
            puts "You are facing north, you see #{bird_string}a radio"
            puts "\n1. Look East\n2. Look West\n3. Look South\n4. Check your inventory\n5. Try calling for help with Radio"
    
            if self.is_in_items?("Bird Seed")
                puts "6. Pick up bird seed (may be useful later)"
            end
        end
    
        def north_choice(choice, player)
    
            if choice == 1 
                puts "Changing direction to the East"
                return "E"
    
            elsif choice == 2
                puts "Changing direction to the West"
                return "W"
    
            elsif choice == 3
                puts "Changing direction to the South"
                return "S"

            elsif choice == 4
                puts player.inv_list
    
            elsif choice == 5
                puts "You grabbed the radio and try a mayday call to get help, unlucky pal, flat batteries!!!"
    
            elsif choice == 6 && self.is_in_items?("Bird Seed")
                puts "Picking up bird seed"
                # Move bird seed from boat to player
                self.remove_item("Bird Seed")
                player.add_item("Bird Seed")
    
            else 
                puts "This is an invalid response"
            end
    
            return nil
        end
    
        def print_east_direction
    
            if self.is_in_items?("Fire Axe")
                fire_string = "and a fire axe"
            else 
                fire_string = ""
            end
    
            puts "You are facing East, you see a beautiful view of the Empire State building #{fire_string}"
            puts "\n1. Look North\n2. Look West\n3. Look South\n4. Check your inventory\n5. Try to swim to the shore"
    
            if self.is_in_items?("Fire Axe")
                puts "6. Pick up Fire Axe"
            end
    
        end
    
        def east_choice(choice, player)
    
            if choice == 1 
                puts "Changing direction to the North"
                return "N"
    
            elsif choice == 2
                puts "Changing direction to the West"
                return "W"
    
            elsif choice == 3
                puts "Changing direction to the South"
                return "S"

            elsif choice == 4
                puts player.inv_list
    
            elsif choice == 5
                puts "You dip your toes in the water and lose them from frostbite"
                puts "You incur a health penalty of 25 hearts"
                lose = player.change_health(-25)
                if lose
                    return lose
                end
    
            elsif choice == 6 && self.is_in_items?("Fire Axe")
                puts "Pick up Fire Axe"
                # Move fire axe from boat to player
                self.remove_item("Fire Axe")
                player.add_item("Fire Axe")
    
            else 
                puts "This is an invalid response"
            end
    
            return nil
        end
    
        def print_south_direction
            puts "You are facing South. Alas! You have spotted a mysterious crate"
            puts "\n1. Look North\n2. Look West\n3. Look East\n4. Check your inventory\n5. Try to open the crate"
        end
    
        
        def south_choice(choice, player)
            if choice == 1 
                puts "Changing direction to the North"
                return "N"

            elsif choice == 2
                puts "Changing direction to the West"
                return "W"

            elsif choice == 3
                puts "Changing direction to the East"
                return "E"

            elsif choice == 4
                puts player.inv_list

            elsif choice == 5 
                if player.is_in_inventory?("Fire Axe")
    
                    player.update_score(150)
                    puts" You have used the fire axe to bust open the crate! Inside the crate is a flare which you use to shoot in the air and behold, Captain Sully just happens to be flying by and decides to drop a rope down and tow to the the edge of the lake before your boat sinks.
                    Congratulations! You have won 150 points with a total of #{player.score}. Phew, that was close! Please make your way out of Central Park and grab a cab to the airport for your next destination."
    
                    dest_input = 0
                    while dest_input != 1
                        puts "Enter 1 to board your flight and travel to the next destination"
                        print ": "
                        dest_input = gets.strip.to_i() 
                    end
                    puts "\n" * 20
                    return "exit"
                else 
                    puts "You try to open the crate with your hands but fail, you need a more powerful tool to open the crate"
                end
    
            else 
                puts "This is an invalid response"
            end
        end
    
        def print_west_direction
    
            if self.is_in_items?("Pizza")
                pizza_string = "next to something delicious. The crust is cooked to perfection and the thickness of the crust is not thin but not super thick either. Just right in the middle. On top of that is some incredible tomato sauce slathered with peperoni and cheese - Big New York style slice pizza."
            else 
                pizza_string = ""
            end
    
            puts "You are facing West. You see a life jacket lying on the floor #{pizza_string}"
            puts "\n1. Look North\n2. Look South\n3. Look East\n4. Check your inventory\n5. Wear Life Jacket."
    
            if self.is_in_items?("Pizza")
                puts "6. Eat Pizza"
            end
        end
    
        def west_choice(choice, player)
    
            if choice == 1 
                puts "Changing direction to the North"
                return "N"
    
            elsif choice == 2
                puts "Changing direction to the South"
                return "S"
    
            elsif choice == 3
                puts "Changing direction to the East"
                return "E"
    
            elsif choice == 5 
                puts "You are outta luck, the life jacket is as old and got holes in it"
    
            elsif choice == 6 && self.is_in_items?("Pizza")
                
                player.change_health(+25)
                puts "That glorious Pizza just earnt you 25 Hearts. Your current health total is: #{player.health}"
                self.remove_item("Pizza")
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    
    end

    def self.new_york_greeting

        puts "Welcome to the Big Apple or otherwise known as New York! 
        You have been greeted at the JFK international airport by Donald Trump and has slapped his trademark 'Make America Great Again' hat on you and set you on your way to Central Park for your first challenge. "
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    
        puts "Arriving at Central Park, you have made it to the lake in the middle and decided to hire a boat to take in the sights of the Big Apple! As you are paddling out towards the centre of the lake, you drop your paddle and it splinters a hole through the bottom of the boat and has sprung a leak! You need to escape the lake as soon as possible before you sink. "
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    end

    def self.boat_escape(player)
        boat = TheBoat.new("boat")
    
        fire_axe_hash = {
            item: "Fire Axe",
            direction: "E"
        }
    
        bird_seed_hash = {
            item: "Bird Seed", 
            direction: "N"
        }
    
        pizza_hash = {
            item: "Pizza",
            direction: "W"
        }
    
        boat_items = {
            fire_axe: fire_axe_hash,
            bird_seed: bird_seed_hash,
            pizza: pizza_hash
        }
    
        boat.add_item(boat_items[:fire_axe])
        boat.add_item(boat_items[:bird_seed])
        boat.add_item(boat_items[:pizza])
    
        puts "\n" * 20
        puts "Look around your sinking vessel and you will be presented with a number of options that could possibly save your life. Quick there's not much time!"
    
        player_direction = "N"
    
        game_over = false
        trapped = true
        while trapped && !game_over
    
            if player_direction == "N"
    
                boat.print_north_direction
        
                print ": "
                choice = gets().strip().to_i() 
                puts "\n" * 20
                location = boat.north_choice(choice, player)
                if location
                    player_direction = location
                end
    
            elsif player_direction == "E"
                # Puts Description
                # List of options
                
                boat.print_east_direction
                print ": "
                choice = gets().strip().to_i() # Check input is good 
                puts "\n" * 20
    
                location = boat.east_choice(choice, player)
                if location == "Game Over, your journey has come to an end!"
                    puts location
                    game_over = true
                elsif location
                    player_direction = location
                end
    
            elsif player_direction == "S"
                # Puts Description
                # List of options
                boat.print_south_direction
                
                print ": "
                choice = gets().strip().to_i() # Check input is good 
                puts "\n" * 20
    
                location = boat.south_choice(choice, player)
                if location == "exit"
                    trapped = false
                elsif location
                    player_direction = location
                end
    
            elsif player_direction == "W"
                
                boat.print_west_direction
    
                print ": "
                choice = gets().strip().to_i() 
                puts "\n" * 20
                
                location = boat.west_choice(choice, player)
                if location
                    player_direction = location
                end
            end
        end
    
        if game_over
            return false
        else 
            return true
        end
    end

    def self.roadblock1(player)
    
        puts "As you were making your way out of Central Park you have come to a roadblock.  It is the old pigeon Lady from the movie Home Alone, she is blocking your path and you need to get rid of the pidgeons somehow. Wouldn't bird seed be useful here?"
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    
        if player.is_in_inventory?("Bird Seed")
            puts "Winner Winner, Pidgeon Dinner!! You have distracted the pidgeons away from the path with the bird seed and you can make your way to the airport!"
        else 
           
            random_number = rand(1..5)
    
            answer = 1
            while answer <= 1 || answer > 5
                puts "The old pidgeon lady has given you an ultimatum: Guess my number between 1 and 5 that is in my head. If you lose I will set my pidgeons on you!"
                print ": "
                answer = gets.strip.to_i()
            end
    
            if answer == random_number
                player.update_score(50)
                puts "The old pidgeon lady has had a change of heart and gives you a warm hug and sends you on your way with a bonus point increase of 50." + " Your total is now: #{player.score}".green
            else
                player.change_health(-25)
                puts "The pidgeons are set loose and peck you over and over. Looks like you got a case of the bird flu. Minus 25 hearts." + " Your health is now at: #{player.health} hearts.".red
            end
        end
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    end
end
