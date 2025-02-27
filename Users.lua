local filesystem = require("filesystem")

function createUser(username, password, trustLevel)
    if filesystem.exists("/home/Users/"+username) == true then
        print("User already exists")
        os.sleep(3)
        return
    end
    filesystem.makeDirectory("/home/Users/"+username)
    
    local userPermissions = io.open("/home/Users/"+username+"permissions","w")
    local userPasswordHash = io.open("/home/Users/"+username+"passwordHash","w")
    
    
    
end