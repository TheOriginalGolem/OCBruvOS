local component = require("component")
local computer = require("computer")
local event = require("event")
local term = require("term")
local filesystem = require("filesystem")
local DoorControl = require("DoorControl")
local Password = require("Password")

function read()
    return io.read()
end

function dots(dotNum)
    for i = 1, dotNum, 1 do
        os.sleep(0.3)
        io.write(".")
    end
    os.sleep(0.6)
end

-- Function to clear the screen
function clearScreen()
    term.clear()
    term.setCursor(1, 1)
end

setupSystem()

while true do
    if login() then
        clearScreen()
        io.write("Access Granted. Launching Main System")
        dots(3)
        loggedIn = true
        mainFunc()
        break
    else
        clearScreen()
        print("Access Denied. Incorrect Password.")
        os.sleep(1.5)
    end
end

function mainFunc()
    while loggedIn == true do
        clearScreen()
        print("Welcome. Please select an option below:")
        print("1. Door Control")
        print("2. Employee Management")
        print("3. Reactor Control")
        print("4. System Maintenance")
        print("0. Logout")

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
            computer.shutdown()
        elseif selectedOption == "0" then
            io.write("Logging Out")
            dots(3)
            clearScreen()
            os.exit()
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
end
