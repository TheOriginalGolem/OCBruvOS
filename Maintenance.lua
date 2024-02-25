function Maintenance()
    while true do
        clearScreen()
        print("Welcome. Please select an option below:")
        print("1. Change Password")
        print("2. Exit to OS")
        print("3. Shutdown")
        print("4. Update System")
        print("0. Exit")

        local selectedOption = read();
        if selectedOption == "1" then
            doorControlMain()
        elseif selectedOption == "2" then
            print("Employee Management WIP")
            os.sleep(1.5)
        elseif selectedOption == "3" then
            print("Reactor Control WIP")
            os.sleep(1.5)
        elseif selectedOption == "4" then
            io.write("Shutting Down")
            dots(3)
            clearScreen()
            os.exit()
        elseif selectedOption == "0" then
            break
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
end