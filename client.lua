local Restricted = {}
local MappingHandlers = {}
local MouseButtons <const> = {
    ['MOUSE_LEFT'] = true, -- Left Click
    ['MOUSE_RIGHT'] = true, -- Right Click
    ['MOUSE_MIDDLE'] = true, -- Middle Click
    ['MOUSE_EXTRABTN1'] = true, -- Mouse button 3
    ['MOUSE_EXTRABTN2'] = true, -- Mouse button 4
    ['MOUSE_EXTRABTN3'] = true, -- Mouse button 5
    ['MOUSE_EXTRABTN4'] = true, -- Mouse button 6
    ['MOUSE_EXTRABTN5'] = true, -- Mouse button 7
    ['IOM_WHEEL_UP'] = true, -- Mouse Wheel Up
    ['IOM_WHEEL_DOWN'] = true, -- Mouse Wheel Down
}


RegisterNetEvent("drez-keybinds/start")
RegisterNetEvent("drez-keybinds/end")


---Is key already registered?
---@param key string
---@return boolean
function IsAlreadyMapped(key)
    return MappingHandlers[key] ~= nil
end

---export: Register handler for key map
---@param key string
function RegisterMappingHandler(key)
    if IsAlreadyMapped(key) then
        return
    end

    local isMouse <const> = MouseButtons[key]
    local bindType <const> = (isMouse and "MOUSE_BUTTON" or "keyboard")
    local bindName <const> = ("bind" .. (isMouse and "m" or "k") .. "_" .. key)
    local label <const> = ((isMouse and "Mouse binding" or "Key binding") .. " " .. key)

    RegisterCommand('+' .. bindName, function()
        if Restricted[key] then return end
        TriggerEvent("drez-keybinds/start", key)
    end, false)

    RegisterCommand('-' .. bindName, function()
        if Restricted[key] then return end
        TriggerEvent("drez-keybinds/end", key)
    end, false)

    RegisterKeyMapping('+' .. bindName, label, bindType, key)
    MappingHandlers[key] = true
end


---export: Disables or enables state for specified key(s)
---@param keys table | string
---@param state boolean
function AddBindRestriction(keys, state)
    if type(keys) == "table" then
        for i=1, #keys do
            Restricted[keys[i]] = state
        end
    else
        Restricted[keys] = state
    end
end

---export: Initializes resource
---@return string?
function RemoteInit()
    local resource = GetInvokingResource()
    if not resource then
        print("Resource cannot be initialized")
        return
    end

    local sharedFile = LoadResourceFile("drez-keybinds", "lib.lua")
    return sharedFile
end


exports("RegisterMappingHandler", RegisterMappingHandler)
exports("AddBindRestriction", AddBindRestriction)
exports("IsAlreadyMapped", IsAlreadyMapped)
exports("Init", RemoteInit)