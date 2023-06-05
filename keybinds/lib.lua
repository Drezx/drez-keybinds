local CreateThreadNow = Citizen.CreateThreadNow
local InputEvents = {}

function AddBind(key, onPress)
    if exports["keybinds"]:CanRegister(key) then
        table.insert(InputEvents, {
            key = key,
            onPress = onPress,
        })
	else
		print('^1Cannot register bind for ^3[' .. key .. ']^1, key is invalid or disabled^0')
	end
end

AddEventHandler("keybinds:start", function(key)
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

AddEventHandler("keybinds:end", function(key)
    for i=1, #InputEvents do
        if (InputEvents[i].key == key) then
            InputEvents[i].releasing = false
        end
    end
end)
