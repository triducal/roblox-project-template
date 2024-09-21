local Vide = require("@Packages/Vide")

export type Props = {
	Name: string?,
	Children: { Instance }?,
}

--[[
Base ScreenGui Component
@param Name: string?
@param Children: { Instance }?
]]
local function ScreenGui(props: Props)
	return Vide.create("ScreenGui")({
		Name = props.Name or "ScreenGui",
		props.Children or {},
	})
end

return ScreenGui
