local component = require("component")
local filesystem = require("filesystem")

loggedIn = true

function setupSystem()
    clearScreen()
    print("Welcome to Bruv OS. Please enter a master password.")
    io.write("Password: ")
    
    local file = io.open(".passwordHash", "w")
    
    local passwordHash = component.data.md5(read())

    if file then
        -- Write the data to the file
        file:write(passwordHash)

        -- Close the file
        file:close()
        print("Data written to the file successfully.")
    else
        print("Failed to open the file for writing.")
    end
end

-- Function to request and validate the password
function login()
    local file = io.open(".passwordHash", "r")

    local correctPassword = file:read("*a")
    file:close()
    clearScreen()
    print("### BruvOS Login ###")
    io.write("Enter password: ")
    local enteredPassword = component.data.md5(read())
    return enteredPassword == correctPassword
end