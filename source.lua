local Plugin = {}

Plugin.PluginName = "Plugin Specific"
Plugin.PluginDescription = "game specific plugins load in their specifc game"
Plugin.Commands = {}

local GameList = {
    ["5985232436"] = "Infectious Smile"
}

for i,v in next, GameList do
    GameList[i] = table.concat(v:split(" "), "_")
end

local FoundGame = GameList[tostring(game.PlaceId)] or GameList[tostring(game.GameId)]

if FoundGame == nil then return Plugin end

if FoundGame then Plugin.Commands = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Toon-arch/Plugin-Specific/main/plugins/%s.lua"):format(FoundGame)))() end

return Plugin
