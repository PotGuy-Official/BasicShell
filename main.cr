# main.cr #

print "\e[H\e[2J"
STDOUT.flush
puts "
██████╗ ███████╗██╗  ██╗
██╔══██╗██╔════╝██║  ██║
██████╔╝███████╗███████║
██╔══██╗╚════██║██╔══██║
██████╔╝███████║██║  ██║
╚═════╝ ╚══════╝╚═╝  ╚═╝ V1.0
------------------------------
"

directory = "C:\\" # Starting Directory

loop do # Main Loop
    print directory + "-> "
    command = gets

    if command
        if command == "exit" # Exit Command
            puts "Exiting..."
            break
        elsif command.starts_with?("echo ") #Echo Command
            puts command[5..-1]
            puts ""
        elsif command == "ls" # List Command
            puts ""
            puts "Contents Of " + directory + ":"
            Dir.each_child(directory) do |item|
                puts item
            end
            puts ""
        elsif command.starts_with?("cd ") # Change Directory Command
            new_dir = command[3..-1]
            potential_path = File.join(directory, new_dir)
            if Dir.exists?(potential_path)
                directory = potential_path
            else
                puts "Directory Not Found: " + potential_path
            end
        elsif command.starts_with?("cdl ") # Change Drive Letter Command
            new_letter = command[4..-1]
            if Dir.exists?(new_letter + ":\\")
                directory = new_letter + ":\\"
            else
                puts "Drive Not Found: " + new_letter + ":\\"
            end
        elsif command == "cls" # Clear Screen Command
            print "\e[H\e[2J"
            STDOUT.flush
            puts "
██████╗ ███████╗██╗  ██╗
██╔══██╗██╔════╝██║  ██║
██████╔╝███████╗███████║
██╔══██╗╚════██║██╔══██║
██████╔╝███████║██║  ██║
╚═════╝ ╚══════╝╚═╝  ╚═╝ V1.0
------------------------------
"
        else
            puts "Unknown Command: #{command}"
        end
    end
end