local screen = script.Parent.Parent.Parent
local buttons = workspace.NameGenerator.Buttons
local screenText = screen.SurfaceGui.Label.Text

local lenScreen = script.Parent.Parent.Parent.lenScreen
local lenScreenText = script.Parent.Parent.Parent.lenScreen.SurfaceGui.Label

local lenIndicator = script.Parent.Parent.Parent.lenIndicator

local clickSound = script.click
local slotSound = script.slotsound

local Names = require(script.Names)
local syllnum = 3

local generatedName = ""

for i,v in pairs(buttons:GetChildren()) do
	if v:FindFirstChild("ClickDetector") then
		v.ClickDetector.MouseClick:Connect(function(plr)
			clickSound:Play()
			for i = 1,syllnum do
				generatedName = generatedName..Names[math.random(1,#Names)]
				for i = 1, math.random(1,5) do
					slotSound:Play()
					screen.Color = Color3.new( math.random(1,10)/10, math.random(1,10)/10,math.random(1,10)/10)
					wait(.1)
				end
			end
			generatedName = (string.upper(string.sub(generatedName, 1, 1))..string.sub(generatedName, 2, -1))
			script.Parent.Text = tostring(generatedName)
			task.wait(.01)
			
			lenIndicator.SurfaceGui.Label.Text = string.len(generatedName)
			if string.len(generatedName) >= 9 then
				print("Too long")
				lenScreen.Color = Color3.new(0.742901, 0.244678, 0.297307)
				lenScreenText.Text = "Too Long!!"
			else if string.len(generatedName) <= 4 then
					print("Too short")
					lenScreen.Color = Color3.new(0.700237, 0.418936, 0.206943)
					lenScreenText.Text = "Too Short!!"
			else 
					print("Perfect")
					lenScreen.Color = Color3.new(0.313756, 0.632532, 0.374411)
					lenScreenText.Text = "Perfect!!"
			end 
			end
			
			generatedName = ""
			
		end)
	end
end