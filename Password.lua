local component = require("component")
local filesystem = require("filesystem")

loggedIn = true

function setupSystem()
    clearScreen()
    print("Welcome to Bruv OS. Please enter a master password.")
    io.write("Password: ")
    
    local file = io.open(".passwordHash", "w")
    
    local passwordHash = component.data.sha256(read())

    if file then
        file:write(passwordHash)

        file:close()
        print("Data written to the file successfully.")
    else
        print("Failed to open the file for writing.")
    end
end

function changePassword()
    local file = io.open(".passwordHash", "w")

    clearScreen()
    print("Please enter a New Password:")
    if file then
        file:write(component.data.sha256(read()))
        file:close()
        io.write("Password changed")
        dots(3)
    else
        print("Failed to change password")
    end
end

function login()
    local file = io.open(".passwordHash", "r")

    local correctPassword = file:read("*a")
    file:close()
    clearScreen()
    print("### BruvOS Login ###")
    io.write("Enter password: ")
    local enteredPassword = component.data.sha256(read())
    return enteredPassword == correctPassword
end