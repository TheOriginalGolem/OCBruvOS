local shell = require("shell")

function MaintenanceMenu()
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
            print("Exitting")
            dots(3)
            os.exit()
        elseif selectedOption == "3" then
            io.write("Logging Out")
            dots(3)
            os.shutdown()
        elseif selectedOption == "4" then
            shell.execute("pastebin run MUnuYSyz")
        elseif selectedOption == "0" then
            break
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
end