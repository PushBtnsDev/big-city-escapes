require_relative 'main_classes.rb'

module London

    class TheDungeon < EscapeRoom

        def print_north_direction
    
            if self.is_in_items? "Prison Slop"
                prison_string = " and on the cold floor a bowl of prison slop"
            else
                prison_string = ""
            end
    
            puts "You are facing North. On the wall are some rusty shackles#{prison_string}"
            puts "\n1. Look East\n2. Look South\n3. Look West"
    
            if self.is_in_items? "Prison Slop"
                puts "4. Eat prison slop"
            end
        end
    
        def north_choice choice, player
    
            if choice == 1 
                puts "Changing direction to the East"
                return "E"
    
            elsif choice == 2
                puts "Changing direction to the South"
                return "S"
    
            elsif choice == 3
                puts "Changing direction to the West"
                return "W"
    
            elsif choice == 4 && (self.is_in_items? "Prison Slop")
                lose = player.change_health -25
                if lose
                    return lose
                end
                puts "That ghetto prison slop has been for 50 years you fool! You just earnt yourself the devil incarnated as your new stomach bug. Your current health total is: #{player.health}"
                self.remove_item "Prison Slop"
            else 
                puts "This is an invalid response"
            end
            return nil
    
    
        end
    
        def print_east_direction
    
            if self.is_in_items? "Book"
                book_string = "and next to it an old leather bound book"
            else
                book_string = ""
            end
            puts "You are facing East. You see on the cobblestone floor a bed of hay #{book_string}."
            puts "\n1. Look North\n2. Look South\n3. Look West\n4. You seem tired, you lay down on the bed of hay"
    
            if self.is_in_items? "Book"
                puts "5. Pick up book"
            end
        end
    
        def east_choice choice, player
    
            if choice == 1 
                puts "Changing direction to the North"
                return "N"
    
            elsif choice == 2
                puts "Changing direction to the South"
                return "S"
    
            elsif choice == 3
                puts "Changing direction to the West"
                return "W"
    
            elsif choice == 4
                lose = player.change_health -25
                if lose
                    return lose
                end
                puts "You lie down and prepare for a restful and peaceful sleep. BANG! You feel the teeth of a rat the size of a snowy mountain brumby gnawing at your neck! You lose 25 hearts of health. Your current health total is: #{player.health}"
            
            elsif choice == 5 && (self.is_in_items? "Book")
                puts "You pick up the book and it seems like it's a part of a 'set' of books."
                self.remove_item "Book"
                player.add_item "Book"
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    
        def print_south_direction
           
            if self.is_in_items? "Bangers and Mash"
                mash_string = "and next to it the english staple: Bangers and Mash."
            else
                mash_string = ""
            end
            puts "You are facing South. You see a large bookshelf with a set of books #{mash_string}"
            puts "\n1. Look North\n2. Look East\n3. Look West\n4. Investigate bookshelf"
    
            if self.is_in_items? "Bangers and Mash"
                puts "5. Eat the Bangers and Mash"
            end
    
        end
    
        def south_choice choice, player
    
            if choice == 1 
                puts "Changing direction to the North"
                return "N"
    
            elsif choice == 2
                puts "Changing direction to the East"
                return "E"
    
            elsif choice == 3
                puts "Changing direction to the West"
                return "W"
    
            elsif choice == 4
                if player.is_in_inventory? "Book"
    
                    player.update_score 150
                    puts "The bookshelves shudders and Guy Fawkes appears from a cloud of dust with some spare dynamite. Guy offers to blast you out of the dungeon. You graciously accept and make your way to freedom having earnt yourself 150 points! Your total is now #{player.score}"
                    dest_input = 0
                    while dest_input != 1
                        puts "Enter 1 to make your way to the finish line!"
                        print ": "
                        dest_input = gets.strip.to_i
                    end
                    return "exit"
                else
                    puts "You investigate the bookshelf and it seems like it is missing a book in a set of books"
                end
    
            elsif choice == 5
                puts "You indulge yourself in the delights of the meal."
                player.change_health 25
                puts "You gain 25 hearts of health, your health total is now: #{player.health}"
                self.remove_item "Bangers and Mash"
                
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    
        def print_west_direction
            puts "You are facing West. You see Jack the Ripper sharpening his blades"
            puts "\n1. Look North\n2. Look East\n3. Look South\n4. Wolf whistle at Jack the Ripper"
        end
    
        def west_choice choice, player
    
            if choice == 1 
                puts "Changing direction to the North"
                return "N"
    
            elsif choice == 2
                puts "Changing direction to the East"
                return "E"
    
            elsif choice == 3
                puts "Changing direction to the South"
                return "S"
            
            elsif choice == 4
                puts "You let out the most antagonising wolf whistle you can muster at Jack the Ripper. His head shoots up from his blades and rushes over to slice you a couple times with his dagger"
                
                lose = player.change_health -25
                if lose
                    return lose
                end
                puts "Good Job, you just lost yourself 25 hearts. Your total health is now: #{player.health}"
    
            else 
                puts "This is an invalid response"
            end
            return nil
        end
    end

    def self.london_greeting

        puts "Welcome to London! 
        London is home to most famous Royal Family in the world and historic landmarks such as Big Ben and Westminster Abbey. 
        You have been greeted at Heathrow Airport by the one and only Sherlock Holmes. He needs your help to solve a crime in East London as there is a serial killer on the loose. His assistant Watson is on annual leave and you need to help him out. "
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i
            puts "\n" * 50
        end
    
        puts "You arrive in East London, its late at night and the two of you are walking along Brick Lane through the foggy London evening. Sherlock and yourself are starting to get the feeling that someone is following you. All of a sudden you are in a struggle with Jack The Ripper! Sherlock Holmes abandons you and runs off down the street like a noodled armed choir girl squealing and you end up knocked out and wake up in a pitch black dungeon room. You need to escape! "
    
        continue = 0
        while continue != 1
            print "Press 1 to continue: "
            continue = gets.strip.to_i
            puts "\n" * 50
        end
    end

    def self.london_dungeon player
        dungeon = TheDungeon.new "The London Dungeon"
    
        slop_hash = {
            item: "Prison Slop",
            direction: "N"
        }
    
        book = {
            item: "Book",
            direction: "E"
        }
    
        bangers_and_hash = {
            item: "Bangers and Mash",
            direction: "S"
        }
    
        dungeon_items = {
            prison_slop: slop_hash,
            book: book,
            bangers_and_mash: bangers_and_hash
        }
    
        dungeon.add_item dungeon_items[:prison_slop]
        dungeon.add_item dungeon_items[:book]
        dungeon.add_item dungeon_items[:bangers_and_mash]
    
        choice = 0
        while choice != 1
            puts "You wake up. It is pitch black. It smells and feels like you are in a London dungeon"
            print ": "
            puts "1. Press 1 to find something to light up the room"
            choice = gets.strip.to_i
        end
        puts "\n" * 50
        puts "You light up the room with an old lighter you find on the floor"
            
        player_direction = "N"
    
        game_over = false
        trapped = true
        while trapped && !game_over
    
            if player_direction == "N"
    
                dungeon.print_north_direction
        
                print ": "
                choice = gets.strip.to_i
                puts "\n" * 50
                
                location = dungeon.north_choice choice, player
                
                if location == "Game Over, your journey has come to an end!"
                    puts location
                    game_over = true
                elsif location
                    player_direction = location
                end
    
            elsif player_direction == "E"
                # Puts Description
                # List of options
                
                dungeon.print_east_direction
                print ": "
                choice = gets.strip.to_i
                puts "\n" * 50
    
                location = dungeon.east_choice choice, player
                if location == "Game Over, your journey has come to an end!"
                    puts location
                    game_over = true
                elsif location
                    player_direction = location
                end
    
            elsif player_direction == "S"
                # Puts Description
                # List of options
                dungeon.print_south_direction
                
                print ": "
                choice = gets.strip.to_i
                puts "\n" * 50
    
                location = dungeon.south_choice choice, player
                if location == "exit"
                    trapped = false
                elsif location
                    player_direction = location
                end
    
            elsif player_direction == "W"
                
                dungeon.print_west_direction
    
                print ": "
                choice = gets.strip.to_i
                puts "\n" * 50
                
                location = dungeon.west_choice choice, player
                if location == "Game Over, your journey has come to an end!"
                    puts location
                    game_over = true
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
    
    def self.roadblock3 player
        puts "\n" * 50
        puts "While making your way to the final finish line you have run into Prince Harry and Meagan Markle, they have a got a quick quiz about your trip to give you a final chance to ensure your victory and accumulate some points and health!"
        puts "Your first question is:  What is New York’s nickname?"
        puts "
        1. The Big Easy
        2. The Big Apple
        3. The Big Banana
        "
        print ": "
        answer = gets.strip.to_i
        puts "\n" * 50
        if answer == 2
            player.update_score 50
            puts "Congratulations, what an awesome start to your quiz! You have won 50 points! Your total is now #{player.score}"
        else
            puts "No, you weren't paying attention were you?".red
        end
    
        
        puts "Your second question is: What the name of the elusive soy chai latte drinking, waist high jeans wearing bearded hipster?"
        puts "
        1. Gerald
        2. Benito
        3. Clive
        "
        print ": "
        answer = gets.strip.to_i
        puts "\n" * 50
        if answer == 3
            player.update_score 50
            puts "Congratulations, yes, Clive is quite the hipster name isn't it!" + " You have won 50 points! Your total is now #{player.score}".green
        else
            puts "No, you weren't paying attention were you?".red
        end
    
        puts "Your third and final question is: What is the name of the movie which the pigeon lady originates from? "
        puts "
        1. Top Gun
        2. Home Alone
        3. The Dark Knight
        "
        print ": "
        answer = gets.strip.to_i
        puts "\n" * 50
        if answer == 2
            player.update_score 50
            puts "Congratulations, on completing the quiz on a high note!" + " You have won 50 points! Your total is now #{player.score}".green
        else
            puts "No, you weren't paying attention were you?".red
        end
    end
end
