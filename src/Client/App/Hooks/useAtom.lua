local Charm = require("@Packages/Charm")
local Vide = require("@Packages/Vide")

--[[
Charm atom hook
```lua
local cash = useAtom(Cash)
print(cash())
```
@param callback: () -> T
]]
local function useAtom<T>(callback: Charm.Molecule<T>)
	local state = Vide.source(callback())
	local disconnect = Charm.subscribe(callback, state)

	Vide.cleanup(disconnect)

	return state
end

return useAtom
