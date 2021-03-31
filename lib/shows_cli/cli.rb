class CLI
    def start
        puts "Welcome to TV Maze! What is your name?"
        input = get_input
        greeting(input)
    end

    def get_input
       gets.strip
    end

    def greeting(name = "User")
        puts "Awesome! Nice to meet you #{name}"
        puts "If you would like to see a list of shows enter the keyword or name of show you want to learn more about, if you want to exit enter please exit." 
        menu
end

    def menu 
        input = get_input
        if input == "please exit"
        goodbye 
        elsif API.new.get_data(input).length != 0
            API.new.get_data(input)
            display_list
        else 
            invalid
        end
        #print out a list
        #exit 
        #invalid 
    end

    def goodbye 
        puts "Thanks for joining come back soon!"
    end

    def invalid 
        puts "hmmmm.... I don't recognize that command please try again."
        menu
    end

    def display_list 
        Show.all.each.with_index(1) do |show, index| 
            puts "#{index}. #{show.name}"
        end
        puts "enter y to learn more about an individual show or enter another keyword to get a new list of shows. "
        input = get_input
        if input == "y"
            asking_about_show 
        else 
            Show.all.clear
            menu
        end
        
    end

    def asking_about_show 
        puts "please enter the name of the show you want to learn more about."
        input = get_input
        show = Show.find_show(input)
        display_details(show)
    end

    def display_details(show) 
        puts "Name: #{show.name}"
    end


end