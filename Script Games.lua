local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/HexHubX/Games/refs/heads/main/ListGames.lua"))()

local URL = Games[game.GameId]

if URL then
  loadstring(game:HttpGet(URL))()
end
