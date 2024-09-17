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
    client_script "@drez-keybinds/lib.lua"
```
or use dynamic link
```lua
    load(exports['drez-keybinds']:Init(), "keybinds")()
```

- Using bind
```lua
    AddBind(key, function)
```
- Disable key, like DisableControlAction
```lua
    AddBindRestriction(keys, state)
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
AddBindRestriction({"Z", "H"}, true)
Wait(3000)
AddBindRestriction({"Z", "H"}, false)
```
