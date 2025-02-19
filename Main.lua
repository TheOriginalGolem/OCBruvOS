local component = require("component")
local computer = require("computer")
local event = require("event")
local term = require("term")
local filesystem = require("filesystem")
local DoorControl = require("DoorControl")
local Password = require("Password")
local Maintenance = require("Maintenance")
local Employee = require("Employee")
--local BruvAI = require("BruvAI")

loggedIn = false

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

function Main()
    while loggedIn == true do
        clearScreen()
        print("Welcome. Please select an option below:")
        print("[1] Door Control")
        print("[2] Employee Management")
        print("[3] Reactor Control")
        print("[4] System Maintenance")
        print("[5] Bruv AI")
        print("[0] Logout")

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
            MaintenanceMenu()
        elseif selectedOption == "5" then
        if pcall(shell.execute("BruvAI.lua")) then

          else
            print("Error Occured")
          end
        elseif selectedOption == "0" then
            io.write("Logging Out")
            dots(3)
            loggedIn = false
        else
            print("Invalid option. Please select a valid option.")
            os.sleep(1.5)
        end
    end
end

local file = io.open("passwordHash.txt", "r")
    
local contents = file:read("*a")

if contents == "" then
    setupSystem()
end

while true do
    if login() then
        clearScreen()
        io.write("Access Granted. Launching Main System")
        dots(3)
        loggedIn = true
        Main()
    else
        clearScreen()
        print("Access Denied. Incorrect Password.")
        os.sleep(1.5)
    end
end

