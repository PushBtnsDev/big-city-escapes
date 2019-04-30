require_relative 'main_classes'

module Melbourne

    class AusOpenBox < EscapeRoom

        def print_north_direction
    
            if self.is_in_items?("Sports Drink")
                drink_string = "At your feet there is one unopened, cool, crisp, refreshing generic sports drink"
            else
                drink_string = ""
            end 
    
            puts "You are facing North. You see the center court with a few seagulls picking up the scraps left in the stands. #{drink_string}"
    
            puts "\n1. Look East\n2. Look West\n3. Look South"
            if self.is_in_items?("Sports Drink")
                puts "4. Drink Sports Drink"
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
    
            elsif choice == 4 && self.is_in_items?("Sports Drink")
                
                player.change_health(+25)
                puts "That effervescent sports drink just earnt you 25 Hearts. Your current health total is: #{player.health}"
                self.remove_item("Sports Drink")
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    
        def print_east_direction
            puts "You are facing East. You spot a big red toolbox in the corner of the room along with one single brick. These items must have been left there by construction workers. "
    
            puts "1. Look North\n2. Look West\n3. Look South\n4. Throw brick at window\n5. Open the toolbox"
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
                puts "When you throw the brick at the window it bounces straight back into your forehead"
                lose = player.change_health(-25)
                if lose
                    return lose
                end
                puts "You've just lost yourself 25 hearts. Your total current health is: #{player.health}"
    
            elsif choice == 5
    
                if player.is_in_inventory?("Key") && self.is_in_items?("Screwdriver")
                    puts "You unlock the toolbox and find a sturdy, yet capable screwdriver. You take it."
                    self.remove_item("Screwdriver")
                    player.add_item("Screwdriver")
                elsif player.is_in_inventory?("Key") && !self.is_in_items?("Screwdriver")
                    puts "You have already taken all you can from this toolbox"
                else 
                    puts "You fail to open the toolbox, it is locked tight."
                end
            else 
                puts "This is an invalid response"
            end
            return nil
    
        end
    
        def print_south_direction
            puts "You are facing South. You see the commentary desk loaded with tennis memarobilia and it has three drawers."
    
            puts "1. Look North\n2. Look West\n3. Look East\n4. Open the first drawer.\n5. Open the second drawer.\n6. Open the third drawer."
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
                puts "Inside the drawer you find a note that reads: 'Hey Lleyton, got a joke for ya: \"What is the definition of endless love?...  Stevie Wonder and Ray Charles playing tennis\" Lots of love - Jim Courier'"
            
            elsif choice == 5
                if self.is_in_items?("Key")
                    puts "Inside the drawer you find the golden key!"
                    self.remove_item("Key")
                    player.add_item("Key")
                else
                    puts "You find an empty drawer"
                end
            
            elsif choice == 6
    
                if self.is_in_items?("Headband")
                    puts "You open the draw and find Pat Cash's 1987 checkered headband and sell it on ebay for 100 bonus points"
                    self.remove_item("Headband")
                    player.update_score(100)
                    puts "Your score is now: #{player.score}"
    
                else
                    puts "The drawer is empty"
                end
    
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    
        def print_west_direction
            puts "You are facing West. You see a vent towards the ceiling and a beam of daylight"
    
            puts "1. Look North\n2. Look South\n3. Look East\n4. Remove the grill"
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
            elsif choice == 4 
                if player.is_in_inventory?("Screwdriver")
    
                    player.update_score(150)
                    puts "You have used the screwdriver to undo the screws holding the grill on the vent. You are temporarily blinded by the daylight and the smell of freedom greets your nose. You climb out and are now free plus earnt yourself 150 points with a total of #{player.score}. Please make your way to Melbourne airport to board your plane for your next destination"
    
                    dest_input = 0
                    while dest_input != 1
                        puts "Enter 1 to board your flight and travel to the next destination"
                        print ": "
                        dest_input = gets.strip.to_i() 
                    end
                    return "exit"
                else 
                    puts "You try to open the vent but realised it is fastened down with screws"
                end
    
            else 
                puts "This is an invalid response"
            end
        end
    end

    def self.melbourne_greeting

        puts "\n" * 20
        puts "Welcome to Melbourne! A bustling combination of sports, live music and coffee culture. 
        You have been greeted at the Melbourne International Airport by the outstanding and one of Australia’s most ‘reputable’ tennis players Nick Kyrgios. He will accompany you to Rod Laver Arena for your next challenge. …Just a tip don’t make him wait too long at the airport as his patience is extremely limited! "
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    
        puts "You have now arrived at Rod Laver Arena and Nick wants to challenge you to a game of tennis. You swiftly beat him in the game of tennis and he is NOT happy.  You are both invited to the commentary box for the post match interview. By this stage Nick is fuming and has gone on one his famous rants which has gone for so long that you fall asleep. When you wake up everyone is gone and you are locked inside the commentary box. Look around and good luck on your escape!"
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i()
            puts "\n" * 20
        end
    end    

    def self.aus_open_escape(player)
        aus_open_commbox = AusOpenBox.new("Australian Open Commentary Box")
    
        sports_drink_hash = {
            item: "Sports Drink",
            direction: "N"
        }
    
        screwdriver_hash = {
            item: "Screwdriver",
            direction: "E"
        }
    
        toolbox_key_hash = {
            item: "Key",
            direction: "S"
        }
    
        pat_cash_hash = {
            item: "Headband",
            direction: "S"
        }
    
        aus_open_items = {
            sports_drink: sports_drink_hash,
            screwdriver: screwdriver_hash,
            toolbox_key: toolbox_key_hash,
            pat_cash: pat_cash_hash
        }
    
        aus_open_commbox.add_item(aus_open_items[:sports_drink])
        aus_open_commbox.add_item(aus_open_items[:screwdriver])
        aus_open_commbox.add_item(aus_open_items[:toolbox_key])
        aus_open_commbox.add_item(aus_open_items[:pat_cash])
    
    
        player_direction = "N"
    
        game_over = false
        trapped = true
        while trapped && !game_over
            if player_direction == "N"
    
                aus_open_commbox.print_north_direction
        
                print ": "
                choice = gets().strip().to_i()  
                puts "\n" * 20
                location = aus_open_commbox.north_choice(choice, player)
                if location
                    player_direction = location
                end
    
            elsif player_direction == "E"
                # Puts Description
                # List of options
                
                aus_open_commbox.print_east_direction
                print ": "
                choice = gets().strip().to_i() 
                puts "\n" * 20
    
                location = aus_open_commbox.east_choice(choice, player)
                if location == "Game Over, your journey has come to an end!"
                    puts location
                    game_over = true
                elsif location
                    player_direction = location
                end
            elsif player_direction == "S"
                # Puts Description
                # List of options
                aus_open_commbox.print_south_direction
                
                print ": "
                choice = gets().strip().to_i() # Check input is good 
                puts "\n" * 20
    
                location = aus_open_commbox.south_choice(choice, player)
                if location
                    player_direction = location
                end
    
            elsif player_direction == "W"
                
                aus_open_commbox.print_west_direction
    
                print ": "
                choice = gets().strip().to_i()  
                puts "\n" * 20
                
                location = aus_open_commbox.west_choice(choice, player)
                if location == "exit"
                    trapped = false
                elsif location
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

    def self.roadblock2(player)

        puts "\n" * 20
        puts" While making your way to the airport you have decided to make a quick pitstop via Brunswick East to grab yourself a quick coffee and while doing so you have been taken hostage by the elusive soy chai latte drinking, mid stomach high jeans wearing bearded hipster named Clive. Clive has challenged you to an eating competition and is adamant it involves his deconstructed Vegemite on toast"
    
        answered = false
        while !answered
            puts "Please enter between 1 and 20 how many pieces of Vegemite on toast you think you can eat: "
            print ": "
            answer = gets.strip.to_i()
            if answer < 8
                puts "Wow... really...thats all you could fit it in??"
                answered = true
            elsif answer > 8 && answer < 12
                player.update_score(100)
                puts "Good onya mate! You won the challenge and now Clive has to shave off his beard and sell out to the man." + " You win 100 points and your score is now #{player.score}".green
                answered = true
            elsif answer > 12 
                player.change_health(-25)
                puts "Congrats you win ya glutton, though now you have overdosed on vitamin B, you lose 25 hearts." + " Your current health is #{player.health}".green
                answered = true
            else 
                puts "This is an invalid input please try again".red
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