# FiveM key binds
- Standalone
- easy to use

# Performance
- Idle: 0.00ms
- Press: 0.00-0.01ms
- Hold: 0.01ms

# Usage
- manifest file link
```lua
    client_script "@keybinds/lib.lua"
```
- Using bind
```lua
    AddBind(key, function)
```
- Disable key, like DisableControlAction
```lua
    exports["keybinds"]:AddBindRestriction(keys, state)
```

# Example
```lua
-- Mouse press
AddBind("MOUSE_RIGHT", function()
    print("Right mouse")
end)

-- Keyboard press
AddBind("H", function()
    print("H pressed")
end)

-- Hold
AddBind("Z", function(InputActive)
    while InputActive() do
        Wait(0)
        print("Z holding")
    end
end)

-- Disable Z and H keys for 3 seconds
exports["keybinds"]:AddBindRestriction({"Z", "H"}, true)
Wait(3000)
exports["keybinds"]:AddBindRestriction({"Z", "H"}, false)
```

# Before using
I recommend setting the values of the buttons you don't use to false 
- keybinds/client.lua:1

![carbon (4)](https://user-images.githubusercontent.com/65835815/183501188-c417c35d-7c9f-4dac-be37-eea51413b37d.png)
- keybinds/client.lua:65

![carbon (3)](https://user-images.githubusercontent.com/65835815/183501198-cf4b6abd-273a-493a-acc8-90f4b9a446b0.png)


