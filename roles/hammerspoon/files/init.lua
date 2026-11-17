hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.window.animationDuration = 0

hs.loadSpoon("Split")

local hyper = {
	"cmd",
	"ctrl",
}

local meh = {
	"ctrl",
	"shift",
	"alt",
}

hs.hotkey.bind(hyper, "X", function()
	spoon.Split.split()
end)

local function current_app()
	return hs.application.frontmostApplication():name()
end

hs.hotkey.bind(hyper, "K", function()
	if current_app() == "Ghostty" then
		hs.application.launchOrFocus("Google Chrome")
	else
		hs.application.launchOrFocus("Ghostty")
	end
end)

hs.hotkey.bind(hyper, "L", function()
	if current_app() == "Slack" then
		hs.application.launchOrFocus("Firefox")
	else
		hs.application.launchOrFocus("Slack")
	end
end)

-- launch app

hs.hotkey.bind(meh, "K", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(meh, "S", function()
	hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(meh, "F", function()
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(meh, "D", function()
	hs.application.launchOrFocus("Figma")
end)

hs.hotkey.bind(meh, "E", function()
	hs.application.launchOrFocus("ethui")
end)

hs.hotkey.bind(meh, "C", function()
	hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(meh, "O", function()
	hs.application.launchOrFocus("Obsidian")
end)

hs.hotkey.bind(meh, "T", function()
	hs.application.launchOrFocus("Todoist")
end)

hs.hotkey.bind(meh, "M", function()
	hs.application.launchOrFocus("Spotify")
end)
