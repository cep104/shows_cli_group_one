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
        puts "Awesome! Nice to meet your #{name}"
        puts "What show would you like to learn about?"
        input = get_input
        API.new.get_data(input)
    end
end