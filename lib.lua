local CreateThreadNow = Citizen.CreateThreadNow
local InputEvents = {}
local ActiveKeys = {}

---Register Mapping
---@param key string
---@param onPress function
function AddBind(key, onPress)
    local nextId = #InputEvents + 1
    InputEvents[nextId] = {
        key = key,
        onPress = onPress,
    }

    exports["drez-keybinds"]:RegisterMappingHandler(key)

    return nextId
end

---Remove key bind
---@param bindId number
function RemoveBind(bindId)
    if InputEvents[bindId] then
        InputEvents[bindId] = nil
    end
end

---Checks is addition key is currently pressed, usefull for keycombo
---@param key string
---@return boolean
function IsPressed(key)
    if not exports["drez-keybinds"]:IsAlreadyMapped(key) then
        print("Key " .. tostring(key) .. " is not mapped, mapping key, next check should be ok")
        exports["drez-keybinds"]:RegisterMappingHandler(key)
        
        return false
    end

    return ActiveKeys[key]
end

---Disables or enables state for specified key(s)
---@param keys string|table
---@param state boolean
function AddBindRestriction(keys, state)
    return exports["drez-keybinds"]:AddBindRestriction(keys, state)
end

AddEventHandler("drez-keybinds/start", function(key)
    ActiveKeys[key] = true

    for i=1, #InputEvents do
        if (InputEvents[i].key == key) then
            CreateThreadNow(function()
                InputEvents[i].releasing = true
                InputEvents[i].onPress(function()
                    return InputEvents[i].releasing
                end)
                
                return
            end)
        end
    end
end)

AddEventHandler("drez-keybinds/end", function(key)
    ActiveKeys[key] = false

    for i=1, #InputEvents do
        if (InputEvents[i].key == key) then
            InputEvents[i].releasing = false
        end
    end
end)