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
I recommend setting the values of the buttons you don't use to false, in example you have enabled WSAD keys and you are not using them it can cause some client latency
- [For keyboard](https://github.com/Drezx/drez-keybinds/blob/9df659fc424907a35a866cdac66943818cfb737e/keybinds/client.lua#L2)
- [For mouse](https://github.com/Drezx/drez-keybinds/blob/9df659fc424907a35a866cdac66943818cfb737e/keybinds/client.lua#LL77C1-L77C1)
