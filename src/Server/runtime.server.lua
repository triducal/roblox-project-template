local Charm = require("@Packages/Charm")
local Loader = require("@Packages/Loader")

local Log = require("@Shared/Log")
local Remotes = require("@Shared/Remotes/Remotes")
local atoms = require("@Shared/Store/Atoms")

local function LoadServices()
	local Services = script.Parent.Services
	Loader.SpawnAll(Loader.LoadDescendants(Services, Loader.MatchesName("Service$")), "Init")
end

local function SyncCharm()
	local server = Charm.sync.server({ atoms = atoms })

	server:connect(function(player: Player, payload: Charm.SyncPayload)
		Remotes.charm.sync(player, payload)
	end)

	Remotes.charm.init:connect(function(player: Player)
		server:hydrate(player)
	end)
end

local function Start()
	SyncCharm()
	LoadServices()
	Log.info("Server initialized")
end

Start()
