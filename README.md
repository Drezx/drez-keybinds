# FiveM key binds
- Standalone
- free to use
- no license

# Before using
I recommend setting the values of the buttons you don't use to false (keybinds/client.lua:1 && keybinds/client.lua:65)


# Usage
```lua
exports['keybinds']:AddBind(key, onPressFunction, onReleaseFunction)
```

# Example
```lua
-- With press only
exports['keybinds']:AddBind('H', function()
    print('H pressed!')
end)

-- With press & release
local Pressing = false
exports['keybinds']:AddBind('Z', function()
    Pressing = true

    while Pressing do
        Citizen.Wait(0)
        print("Pressing Z key")
    end

end, function()
    Pressing = false
end)

-- And for Mouse Button
exports['keybinds']:AddBind('MOUSE_LEFT', function()
    print('Left mouse button')
end)
```
