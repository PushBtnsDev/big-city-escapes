class EscapeRoom

    attr_reader(:name, :items)

    def initialize(name)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def is_in_items?(item)
        # item is a string

        @items.each do |hash|
            if hash[:item] == item
                return true
            end
        end
        return false
    end

    def remove_item(item)
        # Removes 'item' from @items if 'item' is in @items
        @items.each_index do |index|
            if @items[index][:item] == item
                @items.delete_at(index)
            end
        end
    end

    def to_s()
        return "#{@name} has these items: #{@items}"
    end
end


class Player

    attr_reader(:name, :health, :score)
    def initialize(name)
        @name = name
        @inventory = []
        @health = 100
        @score = 0
    end

    def add_item(item)
        @inventory << item
    end

    def change_health(increment)

        if @health + increment <= 0
            return "Game Over, your journey has come to an end!"
        end
        @health += increment
        return nil
    end

    def update_score(increment)
        @score += increment
    end

    def is_in_inventory?(item)
        # item is a string
        @inventory.each do |inventory_item|
            if inventory_item == item
                return true
            end
        end
        return false
    end

    def inv_list()

        if @inventory.length < 1
            return "You have nothing yet!"
        elsif @inventory.length == 1
            return "You have a " + @inventory[0]
        elsif @inventory.length == 2
            return "You have a " + @inventory[0] + " and a " + @inventory[1]
        else
            result = ""
            @inventory.each_index do |index|
                if index == @inventory.length - 1
                    result += "and a " + @inventory[index].to_s
                else
                    result += @inventory[index].to_s + ", "
                end
            end
        end
        
        return "You have the following items: #{result}"
    end

    def to_s()
        return "#{@name} has health: #{@health}, score: #{@score}, and these items: #{@inventory}"
    end
end

