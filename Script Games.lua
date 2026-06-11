local GamesList = loadstring(game:HttpGet("https://raw.githubusercontent.com/HexHubX/Games/refs/heads/main/ListGames.lua"))()

local ScriptURL = GamesList[game.PlaceId]

if ScriptURL then
    loadstring(game:HttpGet(ScriptURL))()
else
    warn("Game not supported: " .. game.PlaceId)
end
