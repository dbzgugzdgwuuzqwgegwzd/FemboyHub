-- services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

-- vars
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:CreateLib(options)
	options = Library:validate({
		name = "Preview Femboy Hub"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main Frame
	do
		-- StarterGui.UILlibrary
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui );
		GUI["1"]["Name"] = [[UILlibrary]];
		GUI["1"]["IgnoreGuiInset"] = true

		-- StarterGui.UILlibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.UILibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.UILlibrary.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.UILlibrary.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.UILlibrary.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];

		-- StarterGui.UILlibrary.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.UILlibrary.Main.TopBar.Extention
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0, 5);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["Name"] = [[Extention]];

		-- StarterGui.UILlibrary.Main.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["9"]["TextSize"] = 14;
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Text"] = options["name"];
		GUI["9"]["Name"] = options["name"];
		GUI["9"]["BackgroundTransparency"] = 1;

		-- StarterGui.UILlibrary.Main.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingTop"] = UDim.new(0, 1);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.UILlibrary.Main.TopBar.Close
		GUI["b"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["b"]["Image"] = [[http://www.roblox.com/asset/?id=6023426922]];
		GUI["b"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Name"] = [[Close]];
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Position"] = UDim2.new(1, -6, 0.5, 0);

		-- StarterGui.UILlibrary.Main.TopBar.Frame
		GUI["c"] = Instance.new("Frame", GUI["6"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["c"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["c"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Position"] = UDim2.new(0, 0, 1, 0);
		
		-- StarterGui.UILlibrary.Main.ContentContainer
		GUI["1b"] = Instance.new("Frame", GUI["2"]);
		GUI["1b"]["BorderSizePixel"] = 0;
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1b"]["BackgroundTransparency"] = 1;
		GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1b"]["Name"] = [[ContentContainer]];
	end
	
	-- Navigation
	do
		-- StarterGui.UILlibrary.Main.Navigation
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["d"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["d"]["Name"] = [[Navigation]];

		-- StarterGui.UILlibrary.Main.Navigation.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.UILlibrary.Main.Navigation.Hide
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["f"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Name"] = [[Hide]];

		-- StarterGui.UILlibrary.Main.Navigation.Hide2
		GUI["10"] = Instance.new("Frame", GUI["d"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["10"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["10"]["Name"] = [[Hide2]];

		-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder
		GUI["11"] = Instance.new("Frame", GUI["d"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["11"]["BackgroundTransparency"] = 1;
		GUI["11"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[ButtonHolder]];

		-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder.UIPadding
		GUI["12"] = Instance.new("UIPadding", GUI["11"]);
		GUI["12"]["PaddingTop"] = UDim.new(0, 8);
		GUI["12"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder.UIListLayout
		GUI["13"] = Instance.new("UIListLayout", GUI["11"]);
		GUI["13"]["Padding"] = UDim.new(0, 1);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.UILlibrary.Main.Navigation.Line
		GUI["1a"] = Instance.new("Frame", GUI["d"]);
		GUI["1a"]["BorderSizePixel"] = 0;
		GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
		GUI["1a"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1a"]["Name"] = [[Line]];
	end
	
	function GUI:CreateTab(options)
		options = Library:validate({
			name = "Preview Tab",
			icon = "rbxassetid://15119252282"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- Render
		do
			-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder.Inactive
			Tab["17"] = Instance.new("TextLabel", GUI["11"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["17"]["TextSize"] = 12;
			Tab["17"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["17"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["17"]["Text"] = options.name;
			Tab["17"]["Name"] = [[Inactive]];
			Tab["17"]["BackgroundTransparency"] = 1;
			Tab["17"]["Position"] = UDim2.new(-0.05000000074505806, 0, 0.1111111119389534, 0);

			-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["18"] = Instance.new("UIPadding", Tab["17"]);
			Tab["18"]["PaddingLeft"] = UDim.new(0, 26);

			-- StarterGui.UILlibrary.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["19"]["BorderSizePixel"] = 0;
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["ImageColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["19"]["Image"] = options.icon;
			Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["19"]["Name"] = [[Icon]];
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Position"] = UDim2.new(0, -22, 0.5, 0);
			
			-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab
			Tab["1c"] = Instance.new("ScrollingFrame", GUI["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["CanvasPosition"] = Vector2.new(0, 0);
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["Selectable"] = false;
			Tab["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["Name"] = options["name"];
			Tab["1c"]["SelectionGroup"] = false;
			Tab["1c"]["Visible"] = false;
			
			-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.UIPadding
			Tab["23"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["23"]["PaddingTop"] = UDim.new(0, 1);
			Tab["23"]["PaddingRight"] = UDim.new(0, 1);
			Tab["23"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["23"]["PaddingLeft"] = UDim.new(0, 1);

			-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.UIListLayout
			Tab["24"] = Instance.new("UIListLayout", Tab["1c"]);
			Tab["24"]["Padding"] = UDim.new(0, 6);
			Tab["24"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		-- Methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["17"], {BackgroundTransparency = .8})
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				Tab["1c"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["17"], {BackgroundTransparency = 1})
				Tab["1c"].Visible = false
			end
		end
		
		-- Logic
		do
			Tab["17"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255,255,255)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			Tab["17"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not  Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(200,200,200)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(200,200,200)})
				end
			end)

			uis.InputBegan:Connect(function(input,gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:CreateButton(options)
			options = Library:validate({
				name = "Preview Button",
				callback = function() end
			},options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button
				Button["1d"] = Instance.new("Frame", Tab["1c"]);
				Button["1d"]["BorderSizePixel"] = 0;
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Button["1d"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1d"]["Name"] = [[Button]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button.UICorner
				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button.UIStroke
				Button["1f"] = Instance.new("UIStroke", Button["1d"]);
				Button["1f"]["Color"] = Color3.fromRGB(82, 82, 82);
				Button["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button.Title
				Button["20"] = Instance.new("TextLabel", Button["1d"]);
				Button["20"]["BorderSizePixel"] = 0;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["20"]["TextSize"] = 14;
				Button["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["20"]["Text"] = options.name;
				Button["20"]["Name"] = [[Title]];
				Button["20"]["BackgroundTransparency"] = 1;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["21"] = Instance.new("UIPadding", Button["1d"]);
				Button["21"]["PaddingTop"] = UDim.new(0, 6);
				Button["21"]["PaddingRight"] = UDim.new(0, 6);
				Button["21"]["PaddingBottom"] = UDim.new(0, 6);
				Button["21"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Button.Icon
				Button["22"] = Instance.new("ImageLabel", Button["1d"]);
				Button["22"]["BorderSizePixel"] = 0;
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["22"]["Image"] = [[rbxassetid://15119649554]];
				Button["22"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["22"]["Name"] = [[Icon]];
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			
			-- Methods
			function Button:SetText(text)
				Button["20"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			--Logic
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true

					Library:tween(Button["1f"], {Color = Color3.fromRGB(62,62,62)})
				end)

				Button["1d"].MouseLeave:Connect(function()
					Button.Hover = false

					if not Button.MouseDown then
						Library:tween(Button["1f"], {Color = Color3.fromRGB(82,82,82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
						Library:tween(Button["1f"], {Color = Color3.fromRGB(200,200,200)})
						options.callback()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false

						if Button.Hover then
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27,27,27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(62,62,62)})
						else
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(27,27,27)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(82,82,82)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:CreateWarning(options)
			options = Library:validate({
				message = "Preview Warning",
			},options or {})
			
			local Warning = {}
			
			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning
				Warning["25"] = Instance.new("Frame", Tab["1c"]);
				Warning["25"]["BorderSizePixel"] = 0;
				Warning["25"]["BackgroundColor3"] = Color3.fromRGB(44, 37, 4);
				Warning["25"]["Size"] = UDim2.new(1, 0, 0, 26);
				Warning["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["25"]["Name"] = [[Warning]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning.UICorner
				Warning["26"] = Instance.new("UICorner", Warning["25"]);
				Warning["26"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning.UIStroke
				Warning["27"] = Instance.new("UIStroke", Warning["25"]);
				Warning["27"]["Color"] = Color3.fromRGB(166, 138, 12);
				Warning["27"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning.Title
				Warning["28"] = Instance.new("TextLabel", Warning["25"]);
				Warning["28"]["BorderSizePixel"] = 0;
				Warning["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Warning["28"]["TextSize"] = 14;
				Warning["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["28"]["Size"] = UDim2.new(0.8973320722579956, 0, 1, 0);
				Warning["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["28"]["Text"] = options.message;
				Warning["28"]["Name"] = [[Title]];
				Warning["28"]["BackgroundTransparency"] = 1;
				Warning["28"]["Position"] = UDim2.new(0.10276679694652557, 0, 0, 0);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning.UIPadding
				Warning["29"] = Instance.new("UIPadding", Warning["25"]);
				Warning["29"]["PaddingTop"] = UDim.new(0, 6);
				Warning["29"]["PaddingRight"] = UDim.new(0, 6);
				Warning["29"]["PaddingBottom"] = UDim.new(0, 6);
				Warning["29"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Warning.Icon
				Warning["2a"] = Instance.new("ImageLabel", Warning["25"]);
				Warning["2a"]["BorderSizePixel"] = 0;
				Warning["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["2a"]["ImageColor3"] = Color3.fromRGB(255, 239, 2);
				Warning["2a"]["Image"] = [[rbxassetid://15119957054]];
				Warning["2a"]["Size"] = UDim2.new(0, 20, 0, 20);
				Warning["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["2a"]["Name"] = [[Icon]];
				Warning["2a"]["BackgroundTransparency"] = 1;
				Warning["2a"]["Position"] = UDim2.new(0, 0, -0.2142857164144516, 0);
			end
			
			-- Methods
			function Warning:SetText(text)
				options.message = text
				Warning["28"].Text = text
			end
			
			return Warning
		end
		
		function Tab:CreateInfo(options)
			options = Library:validate({
				message = "Preview Info",
			},options or {})

			local Info = {}

			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info
				Info["2b"] = Instance.new("Frame", Tab["1c"]);
				Info["2b"]["BorderSizePixel"] = 0;
				Info["2b"]["BackgroundColor3"] = Color3.fromRGB(0, 26, 63);
				Info["2b"]["Size"] = UDim2.new(1, 0, 0, 26);
				Info["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Info["2b"]["Name"] = [[Info]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info.UICorner
				Info["2c"] = Instance.new("UICorner", Info["2b"]);
				Info["2c"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info.UIStroke
				Info["2d"] = Instance.new("UIStroke", Info["2b"]);
				Info["2d"]["Color"] = Color3.fromRGB(0, 67, 166);
				Info["2d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info.Title
				Info["2e"] = Instance.new("TextLabel", Info["2b"]);
				Info["2e"]["BorderSizePixel"] = 0;
				Info["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Info["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Info["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Info["2e"]["TextSize"] = 14;
				Info["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Info["2e"]["Size"] = UDim2.new(0.8973320722579956, 0, 1, 0);
				Info["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Info["2e"]["Text"] = options.message;
				Info["2e"]["Name"] = [[Title]];
				Info["2e"]["BackgroundTransparency"] = 1;
				Info["2e"]["Position"] = UDim2.new(0.10276679694652557, 0, 0, 0);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info.UIPadding
				Info["2f"] = Instance.new("UIPadding", Info["2b"]);
				Info["2f"]["PaddingTop"] = UDim.new(0, 6);
				Info["2f"]["PaddingRight"] = UDim.new(0, 6);
				Info["2f"]["PaddingBottom"] = UDim.new(0, 6);
				Info["2f"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Info.Icon
				Info["30"] = Instance.new("ImageLabel", Info["2b"]);
				Info["30"]["BorderSizePixel"] = 0;
				Info["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Info["30"]["ImageColor3"] = Color3.fromRGB(0, 67, 166);
				Info["30"]["Image"] = [[rbxassetid://15119958837]];
				Info["30"]["Size"] = UDim2.new(0, 20, 0, 20);
				Info["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Info["30"]["Name"] = [[Icon]];
				Info["30"]["BackgroundTransparency"] = 1;
				Info["30"]["Position"] = UDim2.new(0, 0, -0.2142857164144516, 0);
			end

			-- Methods
			function Info:SetText(text)
				options.message = text
				Info["2e"].Text = text
			end

			return Info
		end
		
		function Tab:CreateLabel(options)
			options = Library:validate({
				message = "Preview Label",
			},options or {})

			local Label = {}

			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label
				Label["31"] = Instance.new("Frame", Tab["1c"]);
				Label["31"]["BorderSizePixel"] = 0;
				Label["31"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Label["31"]["Size"] = UDim2.new(1, 0, 0, 26);
				Label["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["31"]["Name"] = [[Label]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label.UICorner
				Label["32"] = Instance.new("UICorner", Label["31"]);
				Label["32"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label.UIStroke
				Label["33"] = Instance.new("UIStroke", Label["31"]);
				Label["33"]["Color"] = Color3.fromRGB(82, 82, 82);
				Label["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label.Title
				Label["34"] = Instance.new("TextLabel", Label["31"]);
				Label["34"]["BorderSizePixel"] = 0;
				Label["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["34"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["34"]["TextSize"] = 14;
				Label["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["34"]["Size"] = UDim2.new(0.8973320722579956, 0, 1, 0);
				Label["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["34"]["Text"] = options.message;
				Label["34"]["Name"] = [[Title]];
				Label["34"]["BackgroundTransparency"] = 1;
				Label["34"]["Position"] = UDim2.new(0.10276679694652557, 0, 0, 0);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label.UIPadding
				Label["35"] = Instance.new("UIPadding", Label["31"]);
				Label["35"]["PaddingTop"] = UDim.new(0, 6);
				Label["35"]["PaddingRight"] = UDim.new(0, 6);
				Label["35"]["PaddingBottom"] = UDim.new(0, 6);
				Label["35"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Label.Icon
				Label["36"] = Instance.new("ImageLabel", Label["31"]);
				Label["36"]["BorderSizePixel"] = 0;
				Label["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["36"]["ImageColor3"] = Color3.fromRGB(82, 82, 82);
				Label["36"]["Image"] = [[rbxassetid://15119960645]];
				Label["36"]["Size"] = UDim2.new(0, 20, 0, 20);
				Label["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["36"]["Name"] = [[Icon]];
				Label["36"]["BackgroundTransparency"] = 1;
				Label["36"]["Position"] = UDim2.new(0, 0, -0.2142857164144516, 0);
			end

			-- Methods
			function Label:SetText(text)
				options.message = text
				Label["34"].Text = text
			end

			return Label
		end
		
		function Tab:CreateSlider(options)
			options = Library:validate({
				title = "Preview Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) print(v) end
			},options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider
				Slider["37"] = Instance.new("Frame", Tab["1c"]);
				Slider["37"]["BorderSizePixel"] = 0;
				Slider["37"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Slider["37"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["37"]["Name"] = [[Slider]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["38"] = Instance.new("UICorner", Slider["37"]);
				Slider["38"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.UIStroke
				Slider["39"] = Instance.new("UIStroke", Slider["37"]);
				Slider["39"]["Color"] = Color3.fromRGB(82, 82, 82);
				Slider["39"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.Title
				Slider["3a"] = Instance.new("TextLabel", Slider["37"]);
				Slider["3a"]["BorderSizePixel"] = 0;
				Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["3a"]["TextSize"] = 14;
				Slider["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3a"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3a"]["Text"] = options.title;
				Slider["3a"]["Name"] = [[Title]];
				Slider["3a"]["BackgroundTransparency"] = 1;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["3b"] = Instance.new("UIPadding", Slider["37"]);
				Slider["3b"]["PaddingTop"] = UDim.new(0, 6);
				Slider["3b"]["PaddingRight"] = UDim.new(0, 6);
				Slider["3b"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["3b"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.Value
				Slider["3c"] = Instance.new("TextLabel", Slider["37"]);
				Slider["3c"]["BorderSizePixel"] = 0;
				Slider["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3c"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["3c"]["TextSize"] = 14;
				Slider["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3c"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["3c"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3c"]["Text"] = tostring(options.default);
				Slider["3c"]["Name"] = [[Value]];
				Slider["3c"]["BackgroundTransparency"] = 1;
				Slider["3c"]["Position"] = UDim2.new(1, 0, 0, 0);
				
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["3d"] = Instance.new("Frame", Slider["37"]);
				Slider["3d"]["BorderSizePixel"] = 0;
				Slider["3d"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["3d"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["3d"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3d"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["3d"]["Name"] = [[SliderBack]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["3e"] = Instance.new("UIStroke", Slider["3d"]);
				Slider["3e"]["Color"] = Color3.fromRGB(64, 64, 64);
				Slider["3e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["3f"] = Instance.new("Frame", Slider["3d"]);
				Slider["3f"]["BorderSizePixel"] = 0;
				Slider["3f"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
				Slider["3f"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3f"]["Name"] = [[Draggable]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["40"] = Instance.new("UICorner", Slider["3f"]);
				Slider["40"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["41"] = Instance.new("UICorner", Slider["3d"]);
				Slider["41"]["CornerRadius"] = UDim.new(0, 4);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["37"].AbsolutePosition.X ) / (Slider["37"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
				
					Slider["3c"].Text = tostring(value)
					Slider["3f"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["3c"].Text = tostring(v)
					Slider["3f"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)),1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["3c"].Text)
			end
			
			-- Logic
			do
				Slider["37"].MouseEnter:Connect(function()
					Slider.Hover = true
					
					Library:tween(Slider["39"], {Color = Color3.fromRGB(62,62,62)})
					Library:tween(Slider["3e"], {Color = Color3.fromRGB(62,62,62)})
					Library:tween(Slider["3f"], {BackgroundColor3 = Color3.fromRGB(62,62,62)})
				end)

				Slider["37"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["39"], {Color = Color3.fromRGB(82,82,82)})
						Library:tween(Slider["3e"], {Color = Color3.fromRGB(82,82,82)})
						Library:tween(Slider["3f"], {BackgroundColor3 = Color3.fromRGB(82,82,82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["37"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
						Library:tween(Slider["39"], {Color = Color3.fromRGB(200,200,200)})
						Library:tween(Slider["3e"], {Color = Color3.fromRGB(200,200,200)})
						Library:tween(Slider["3f"], {BackgroundColor3 = Color3.fromRGB(200,200,200)})
						
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							Library:tween(Slider["37"], {BackgroundColor3 = Color3.fromRGB(27,27,27)})
							Library:tween(Slider["39"], {Color = Color3.fromRGB(62,62,62)})
							Library:tween(Slider["3e"], {Color = Color3.fromRGB(62,62,62)})
							Library:tween(Slider["3f"], {BackgroundColor3 = Color3.fromRGB(62,62,62)})
						else
							Library:tween(Slider["37"], {BackgroundColor3 = Color3.fromRGB(27,27,27)})
							Library:tween(Slider["39"], {Color = Color3.fromRGB(82,82,82)})
							Library:tween(Slider["3e"], {Color = Color3.fromRGB(82,82,82)})
							Library:tween(Slider["3f"], {BackgroundColor3 = Color3.fromRGB(82,82,82)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:CreateToggle(options)
			options = Library:validate({
				title = "Preview Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["53"] = Instance.new("Frame", Tab["1c"]);
				Toggle["53"]["BorderSizePixel"] = 0;
				Toggle["53"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
				Toggle["53"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["53"]["Name"] = [[Toggle]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["54"] = Instance.new("UICorner", Toggle["53"]);
				Toggle["54"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIStroke
				Toggle["55"] = Instance.new("UIStroke", Toggle["53"]);
				Toggle["55"]["Color"] = Color3.fromRGB(82, 82, 82);
				Toggle["55"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["56"] = Instance.new("TextLabel", Toggle["53"]);
				Toggle["56"]["BorderSizePixel"] = 0;
				Toggle["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["56"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["56"]["TextSize"] = 14;
				Toggle["56"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["56"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["56"]["Text"] = options.title;
				Toggle["56"]["Name"] = [[Title]];
				Toggle["56"]["BackgroundTransparency"] = 1;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["57"] = Instance.new("UIPadding", Toggle["53"]);
				Toggle["57"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["57"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["57"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["57"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["58"] = Instance.new("Frame", Toggle["53"]);
				Toggle["58"]["BorderSizePixel"] = 0;
				Toggle["58"]["BackgroundColor3"] = Color3.fromRGB(64, 64, 64);
				Toggle["58"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["58"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["58"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["58"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["59"] = Instance.new("UICorner", Toggle["58"]);
				Toggle["59"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["5a"] = Instance.new("UIStroke", Toggle["58"]);
				Toggle["5a"]["Color"] = Color3.fromRGB(82, 82, 82);
				Toggle["5a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.UILlibrary.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["5b"] = Instance.new("ImageLabel", Toggle["58"]);
				Toggle["5b"]["BorderSizePixel"] = 0;
				Toggle["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["5b"]["ImageTransparency"] = 1;
				Toggle["5b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["5b"]["Image"] = [[rbxassetid://15120419547]];
				Toggle["5b"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["5b"]["Name"] = [[Checkmark]];
				Toggle["5b"]["BackgroundTransparency"] = 1;
				Toggle["5b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			-- Methods
			function Toggle:Toggle(b)
				if b == nil then
					Toggle.State = not Toggle.State
				else
					Toggle.State = b
				end
				
				if Toggle.State then
					Library:tween(Toggle["58"], {BackgroundColor3 = Color3.fromRGB(115, 191, 92)})
					Library:tween(Toggle["5b"], {ImageTransparency = 0})
				else
					Library:tween(Toggle["58"], {BackgroundColor3 = Color3.fromRGB(64, 64, 64)})
					Library:tween(Toggle["5b"], {ImageTransparency = 1})
				end
				
				
				options.callback(Toggle.State)
			end
			
			-- Logic
			do
				Toggle["53"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Library:tween(Toggle["55"], {Color = Color3.fromRGB(62,62,62)})
				end)

				Toggle["53"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["55"], {Color = Color3.fromRGB(82,82,82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["53"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
						Library:tween(Toggle["55"], {Color = Color3.fromRGB(200,200,200)})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:tween(Toggle["53"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Toggle["55"], {Color = Color3.fromRGB(62,62,62)})
						else
							Library:tween(Toggle["53"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Toggle["55"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		return Tab
	end
	
	return GUI
end

return Library