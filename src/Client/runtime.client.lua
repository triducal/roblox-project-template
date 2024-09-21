local Players = game:GetService("Players")

local Charm = require("@Packages/Charm")
local Loader = require("@Packages/Loader")
local Vide = require("@Packages/Vide")

local Log = require("@Shared/Log")
local Remotes = require("@Shared/Remotes/Remotes")
local atoms = require("@Shared/Store/Atoms")

local App = require("@Client/App/App")

local function LoadControllers()
	local Controllers = script.Parent.Controllers
	Loader.SpawnAll(Loader.LoadDescendants(Controllers, Loader.MatchesName("Controller$")), "Init")
end

local function MountApp()
	local Player = Players.LocalPlayer
	local PlayerGui = Player:WaitForChild("PlayerGui")

	Vide.mount(App, PlayerGui)
end

local function SyncCharm()
	local client = Charm.sync.client({ atoms = atoms })

	Remotes.charm.sync:connect(function(payload: Charm.SyncPayload)
		client:sync(payload)
	end)

	Remotes.charm.init()
end

local function Start()
	SyncCharm()
	MountApp()
	LoadControllers()
	Log.info("Client initialized")
end

Start()
