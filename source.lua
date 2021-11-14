local Plugin = {}
Plugin.PluginName = "Plugin Specific"
Plugin.PluginDescription = "game specific plugins load in their specifc game"
Plugin.Commands = {}
local GameList = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Toon-arch/Plugin-Specific/main/games.lua"))()
for i,v in next, GameList do GameList[i] = table.concat(v:split(" "), "_") end
local FoundGame = GameList[tostring(game.PlaceId)]
if FoundGame == nil then return Plugin end
if FoundGame ~= nil then Plugin.Commands = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Toon-arch/Plugin-Specific/main/plugins/%s.lua"):format(string.lower(tostring(FoundGame)))))() end
return Plugin
