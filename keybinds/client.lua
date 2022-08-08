local KeyboardKeys = {
	['Q'] = true, -- used
	['W'] = false, -- not used
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
	['F'] = true,
	['G'] = true,
	['H'] = true,
	['J'] = true,
	['K'] = true,
	['L'] = true,
	['Z'] = true,
	['X'] = true,
	['C'] = true,
	['V'] = true,
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
	['F8'] = true,
	['F9'] = true,
	['F10'] = true,
	['F11'] = true,
	['F12'] = true,
	['1'] = true, 
	['2'] = true, 
	['3'] = true, 
	['4'] = true, 
	['5'] = true, 
	['6'] = true, 
	['7'] = true, 
	['8'] = true, 
	['9'] = true, 
	['0'] = true,
    ['OEM_3'] = true, -- `~
    ['TAB'] = true,
    ['RETURN'] = true, -- ENTER
    ['ESCAPE'] = true, -- ESC
    ['SPACE'] = true,
    ['PAGEUP'] = true,
    ['PAGEDOWN'] = true,
    ['INSERT'] = true,
    ['DELETE'] = true,
    ['PLUS'] = false, -- +
    ['MINUS'] = false, -- -
    -- All buttons: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

}

local MouseButtons = {
    ['MOUSE_LEFT'] = false,
    ['MOUSE_RIGHT'] = true,
    ['MOUSE_MIDDLE'] = true,
    ['MOUSE_EXTRABTN1'] = false, -- Mouse button 3
    ['MOUSE_EXTRABTN2'] = false, -- Mouse button 4
    ['MOUSE_EXTRABTN3'] = false, -- Mouse button 5
    ['MOUSE_EXTRABTN4'] = false, -- Mouse button 6
    ['MOUSE_EXTRABTN5'] = false, -- Mouse button 7

}

local InputEvents = {}

function AddBind(key, onPress, onRelease)
	if KeyboardKeys[key] or MouseButtons[key] then
		table.insert(InputEvents, {
			key = key,
			onPress = onPress,
			onRelease = onRelease,
		})
	else
		print('^1Cannot register bind for ^3[' .. key .. ']^1, key is invalid or disabled^0')
	end
end

for k,v in pairs(KeyboardKeys) do
    if v then
        RegisterCommand('+bind_' .. k, function()
            for i=1, #InputEvents do
                if (InputEvents[i].key == k) then
                    Citizen.CreateThread(function()
                        InputEvents[i].onPress()
                        TerminateThread(GetIdOfThisThread())
                    end)
                end
            end
        end)

        RegisterCommand('-bind_' .. k, function()
            for i=1, #InputEvents do
                if (InputEvents[i].key == k) then
                    if (InputEvents[i].onRelease ~= nil) then
                        Citizen.CreateThread(function()
                            InputEvents[i].onRelease()
                            TerminateThread(GetIdOfThisThread())
                        end)
                    end
                end
            end
        end)

        RegisterKeyMapping('+bind_' .. k, 'Key bind','keyboard', k)
    end
end

for k,v in pairs(MouseButtons) do
    if v then
        RegisterCommand('+bind_' .. k, function()
            for i=1, #InputEvents do
                if (InputEvents[i].key == k) then
                    Citizen.CreateThread(function()
                        InputEvents[i].onPress()
                        TerminateThread(GetIdOfThisThread())
                    end)
                end
            end
        end)

        RegisterCommand('-bind_' .. k, function()
            for i=1, #InputEvents do
                if (InputEvents[i].key == k) then
                    if (InputEvents[i].onRelease ~= nil) then
                        Citizen.CreateThread(function()
                            InputEvents[i].onRelease()
                            TerminateThread(GetIdOfThisThread())
                        end)
                    end
                end
            end
        end)


        RegisterKeyMapping('+bind_' .. k, "Mouse Bind", "MOUSE_BUTTON", k)
    end
end
