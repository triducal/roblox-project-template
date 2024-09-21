local Players = game:GetService("Players")

local Datastore = require("@Shared/Store/Datastore")
local useAtom = require("@Hooks/useAtom")

local function useCash()
	return useAtom(function()
		local data = Datastore.getPlayerData(Players.LocalPlayer.Name)

		return data and data.Cash or 0
	end)
end

return useCash
