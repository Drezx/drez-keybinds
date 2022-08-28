# FiveM key binds
- Standalone
- free to use
- no license

# Usage
```lua
exports['keybinds']:AddBind(key, onPressFunction, hold?)
```

# Example
```lua
-- Mouse press
exports['keybinds']:AddBind("MOUSE_RIGHT", function()
    print("Right mouse button pressed")
end)

-- Keyboard Press
exports['keybinds']:AddBind("H", function()
    print("H pressed")
end)

-- Hold
exports['keybinds']:AddBind("Z", function(InputActive)
    while InputActive() do
        Citizen.Wait(0)
        print("Z hold")
    end
end, true)
```

# Before using
I recommend setting the values of the buttons you don't use to false 
- keybinds/client.lua:1

![carbon (4)](https://user-images.githubusercontent.com/65835815/183501188-c417c35d-7c9f-4dac-be37-eea51413b37d.png)
- keybinds/client.lua:65

![carbon (3)](https://user-images.githubusercontent.com/65835815/183501198-cf4b6abd-273a-493a-acc8-90f4b9a446b0.png)


