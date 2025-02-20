component = require("component")
computer = require("computer")
event = require("event")
term = require("term")
shell = require("shell")
filesystem = require("filesystem")
DoorControl = require("DoorControl")
Password = require("Password")
Maintenance = require("Maintenance")
Updates = require("Updates")
Employee = require("Employee")
BruvAI = require("BruvAI")

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


function clearScreen()
    term.clear()
    term.setCursor(1, 1)
end

function displayLogo()
    local logofile = io.open("Logo.txt", "r")
    local logotext = logofile:read("*a")
    logofile:close()

    print(logotext)
end

function Main()
    while loggedIn == true do
        clearScreen()
        displayLogo()
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
            --UpdateMenu()
        elseif selectedOption == "5" then
            --shell.execute("BruvAI.lua")   
            aiTest()
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

local file = io.open(".passwordHash", "r")
    
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

