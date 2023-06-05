local Restricted = {}
local KeyboardKeys = {
	['Q'] = true,
	['W'] = false,
	['E'] = true,
	['R'] = true,
	['T'] = true,
	['Y'] = true,
	['U'] = true,
	['I'] = true,
	['O'] = true,
	['P'] = true,
	['A'] = false,
	['S'] = false,
	['D'] = false,
	['F'] = false,
	['G'] = false,
	['H'] = true,
	['J'] = false,
	['K'] = true,
	['L'] = true,
	['Z'] = true,
	['X'] = true,
	['C'] = false,
	['V'] = false,
	['B'] = true,
	['N'] = true,
	['M'] = true,
	['F1'] = true,
	['F2'] = true,
	['F3'] = true,
	['F4'] = true,
	['F5'] = true,
	['F6'] = true,
	['F7'] = true,
	['F8'] = false,
	['F9'] = true,
	['F10'] = true,
	['F11'] = false,
	['F12'] = false,
	['1'] = true, 
	['2'] = true, 
	['3'] = true, 
	['4'] = true, 
	['5'] = true, 
	['6'] = true, 
	['7'] = false, 
	['8'] = false, 
	['9'] = false, 
	['0'] = false,
    ['CAPITAL'] = true, -- capslock
    ['OEM_3'] = false, -- `~
    ['OEM_4'] = true, -- [
    ['OEM_6'] = true, -- ]
    ['TAB'] = false,
    ['RETURN'] = true, -- ENTER
    ['ESCAPE'] = true, -- ESC
    ['SPACE'] = false,
    ['PAGEUP'] = true,
    ['PAGEDOWN'] = true,
    ['INSERT'] = true,
    ['DELETE'] = true,
    ['HOME'] = true,
	['BACK'] = true,
	['UP'] = true,
	['DOWN'] = true,
	['RIGHT'] = true,
	['LEFT'] = true,
    ['PLUS'] = true, -- +
    ['MINUS'] = false, -- -
    ['LCONTROL'] = true,
    ['LMENU'] = true,

    -- more here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
}

local MouseButtons = {
    ['MOUSE_LEFT'] = true,
    ['MOUSE_RIGHT'] = true,
    ['MOUSE_MIDDLE'] = false,
    ['MOUSE_EXTRABTN1'] = false, -- Mouse button 3
    ['MOUSE_EXTRABTN2'] = false, -- Mouse button 4
    ['MOUSE_EXTRABTN3'] = false, -- Mouse button 5
    ['MOUSE_EXTRABTN4'] = false, -- Mouse button 6
    ['MOUSE_EXTRABTN5'] = false, -- Mouse button 7

}


RegisterNetEvent("keybinds:start")
RegisterNetEvent("keybinds:end")


CreateThread(function()
    for key, enable in pairs(KeyboardKeys) do
        if enable then
            RegisterCommand('+bindk_' .. key, function()
                if Restricted[key] then return end
                TriggerEvent("keybinds:start", key)
            end)
    
            RegisterCommand('-bindk_' .. key, function()
                if Restricted[key] then return end
                TriggerEvent("keybinds:end", key)
            end)
    
            RegisterKeyMapping('+bindk_' .. key, 'Key binding ' .. key, 'keyboard', key)
        end
    end
    
    for key, enable in pairs(MouseButtons) do
        if enable then
            RegisterCommand('+bindm_' .. key, function()
                if Restricted[key] then return end
                TriggerEvent("keybinds:start", key)
            end)
    
            RegisterCommand('-bindm_' .. key, function()
                if Restricted[key] then return end
                TriggerEvent("keybinds:end", key)
            end)
    
            RegisterKeyMapping('+bindm_' .. key, "Key binding " .. key, "MOUSE_BUTTON", key)
        end
    end
end)


function CanRegister(key)
    if KeyboardKeys[key] or MouseButtons[key] then
        return true
    end

    return false
end

function AddBindRestriction(keys, state)
    for i=1, #keys do
        Restricted[keys[i]] = state
    end
end
