local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local LeftFrame = Instance.new("Frame")
local LeftCorner = Instance.new("UICorner")
local GameImage = Instance.new("ImageLabel")
local ImageCorner = Instance.new("UICorner")
local PlayButton = Instance.new("TextButton")
local RightFrame = Instance.new("Frame")
local RightCorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")

ScreenGui.Name = "GameSelector"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.12
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(30, 30, 30)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
local CloseCorner = Instance.new("UICorner")

CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -35, 0, 7)
CloseButton.BackgroundColor3 = Color3.fromRGB(170, 35, 35)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.BorderSizePixel = 0
CloseButton.ZIndex = 5

CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

LeftFrame.Name = "LeftFrame"
LeftFrame.Parent = MainFrame
LeftFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LeftFrame.BackgroundTransparency = 0.2
LeftFrame.Position = UDim2.new(0, 10, 0, 10)
LeftFrame.Size = UDim2.new(0, 220, 1, -20)
LeftFrame.BorderSizePixel = 0

LeftCorner.CornerRadius = UDim.new(0, 6)
LeftCorner.Parent = LeftFrame

GameImage.Name = "GameImage"
GameImage.Parent = LeftFrame
GameImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GameImage.Position = UDim2.new(0.5, -70, 0.5, -100)
GameImage.Size = UDim2.new(0, 140, 0, 140)
GameImage.Image = "rbxassetid://96583453920828"
GameImage.ScaleType = Enum.ScaleType.Crop

ImageCorner.CornerRadius = UDim.new(0, 6)
ImageCorner.Parent = GameImage

PlayButton.Name = "PlayButton"
PlayButton.Parent = LeftFrame
PlayButton.BackgroundTransparency = 1
PlayButton.Position = UDim2.new(0.5, -25, 1, -60)
PlayButton.Size = UDim2.new(0, 50, 0, 50)
PlayButton.Font = Enum.Font.GothamBold
PlayButton.Text = "▶"
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.TextSize = 40

RightFrame.Name = "RightFrame"
RightFrame.Parent = MainFrame
RightFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
RightFrame.BackgroundTransparency = 0.2
RightFrame.Position = UDim2.new(0, 240, 0, 10)
RightFrame.Size = UDim2.new(0, 250, 1, -20)
RightFrame.BorderSizePixel = 0

RightCorner.CornerRadius = UDim.new(0, 6)
RightCorner.Parent = RightFrame

UIListLayout.Parent = RightFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

UIPadding.Parent = RightFrame
UIPadding.PaddingTop = UDim.new(0, 15)
UIPadding.PaddingBottom = UDim.new(0, 15)
UIPadding.PaddingLeft = UDim.new(0, 20)

local GamesScripts = {
    [5523851880] = "https://raw.githubusercontent.com/HexHubX/Main/refs/heads/main/HexHubX%20Ball%20Pool.lua",
    [142823291] = "https://raw.githubusercontent.com/HexHubX/Main/refs/heads/main/Murder%20Mystery%202.lua%20(10)_protected.lua",
    [994732206] = "https://raw.githubusercontent.com/HexHubX/Main/refs/heads/main/Bloxfruit.lua%20(1)_protected.lua",
    [79447450627856] = "https://raw.githubusercontent.com/HexHubX/Main/refs/heads/main/Throw%20Food%20For%20Animals.lua_protected%20(1).lua"
}

local DisplayGames = {
    {
        Name = "Blox Fruits",
        Image = "rbxassetid://112576328653271",
        Status = "Working",
        Key = 994732206
    },
    {
        Name = "Murder Mystery 2",
        Image = "rbxassetid://97575452736294",
        Status = "Working",
        Key = 142823291
    },
    {
        Name = "8Ball Pool",
        Image = "rbxassetid://96583453920828",
        Status = "Updating",
        Key = 5523851880
    },
    {
        Name = "Throw Food For Animals",
        Image = "rbxassetid://79447450627856",
        Status = "Working",
        Key = 79447450627856
    }
}

local selectedUrl = ""
local currentPlaceId = game.PlaceId

for i, gameInfo in ipairs(DisplayGames) do
    local ItemFrame = Instance.new("Frame")
    local StatusDot = Instance.new("Frame")
    local DotCorner = Instance.new("UICorner")
    local NameLabel = Instance.new("TextLabel")
    local ClickButton = Instance.new("TextButton")

    ItemFrame.Name = "Item_" .. i
    ItemFrame.Parent = RightFrame
    ItemFrame.BackgroundTransparency = 1
    ItemFrame.Size = UDim2.new(1, 0, 0, 35)
    ItemFrame.LayoutOrder = i

    StatusDot.Name = "StatusDot"
    StatusDot.Parent = ItemFrame
    StatusDot.BackgroundColor3 = gameInfo.Status == "Working" and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 165, 0)
    StatusDot.Position = UDim2.new(0, 5, 0.5, -6)
    StatusDot.Size = UDim2.new(0, 12, 0, 12)
    StatusDot.BorderSizePixel = 0

    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = StatusDot

    NameLabel.Name = "NameLabel"
    NameLabel.Parent = ItemFrame
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 30, 0, 0)
    NameLabel.Size = UDim2.new(1, -30, 1, 0)
    NameLabel.Font = Enum.Font.Gotham
    NameLabel.Text = gameInfo.Name
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 14
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left

    ClickButton.Name = "ClickButton"
    ClickButton.Parent = ItemFrame
    ClickButton.BackgroundTransparency = 1
    ClickButton.Size = UDim2.new(1, 0, 1, 0)
    ClickButton.Text = ""

    ClickButton.MouseButton1Click:Connect(function()
        GameImage.Image = gameInfo.Image
        selectedUrl = GamesScripts[gameInfo.Key] or ""

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://116902184912832"
        sound.Volume = 0.5
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
    end)

    if i == 1 then
        GameImage.Image = gameInfo.Image
        selectedUrl = GamesScripts[gameInfo.Key] or ""
    end
end

PlayButton.MouseButton1Click:Connect(function()
    local scriptToRun = GamesScripts[currentPlaceId]

    if not scriptToRun or scriptToRun == "" then
        scriptToRun = selectedUrl
    end

    if scriptToRun and scriptToRun ~= "" then
        local success, result = pcall(function()
            local source = game:HttpGet(scriptToRun)
            local func = loadstring(source)
            if not func then
                error("Script compilation failed")
            end
            func()
        end)

        if success then
            ScreenGui:Destroy()
        else
            warn("Script Error: " .. tostring(result))
        end
    end
end)
