local DataConfig = require("@Shared/Config/Data")

local Charm = require("@Packages/Charm")
local Remap = require("@Shared/Remap")

export type PlayerData = typeof(DataConfig.DefaultData)

local datstore = {
	players = Charm.atom({}),
}

local Store = {}

Store.datastore = datstore

function Store.getPlayerData(id: string): PlayerData
	return datstore.players()[id]
end

function Store.setPlayerData(id: string, data: PlayerData)
	datstore.players(function(state)
		return Remap.set(state, id, data)
	end)
end

function Store.deletePlayerData(id: string)
	datstore.players(function(state)
		return Remap.delete(state, id)
	end)
end

function Store.updatePlayerData(id: string, updater: (PlayerData) -> PlayerData)
	datstore.players(function(state)
		return Remap.change(state, id, updater)
	end)
end

return Store
