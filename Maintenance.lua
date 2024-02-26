local shell = require("shell")

function changePassword()
    local file = io.open("passwordHash.txt", "w")

    clearScreen()
    print("Please enter a New Password:")
    if file then
        file:write(read())
        file:close()
        io.write("Password changed")
        dots(3)
    else
        print("Failed to change password")
    end
end

function MaintenanceMenu()
    while true do
        clearScreen()
        print("Maintenance Menu:")
        print("1. Change Password")
        print("2. Exit to OS")
        print("3. Shutdown")
        print("4. Update System")
        print("0. Exit")

        local selectedOption = read();
        if selectedOption == "1" then
            changePassword()
        elseif selectedOption == "2" then
            io.write("Exitting")
            dots(3)
            clearScreen()
            os.exit()
        elseif selectedOption == "3" then
            io.write("Shutting Down")
            dots(3)
            shell.execute("shutdown")
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