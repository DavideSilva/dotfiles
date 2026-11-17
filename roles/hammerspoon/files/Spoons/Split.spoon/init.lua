--- === Split ===

local m = {
  name = "Split",
  version = "1.1",
  author = "Evan Travers <evantravers@gmail.com>",
  license = "MIT <https://opensource.org/licenses/MIT>",
  homepage = "https://github.com/evantravers/split.spoon",
}

--- Split:split() -> table
--- Method
--- Presents an hs.chooser to pick a window to split your monitor with
m.split = function()
  local windows = hs.fnutils.map(hs.window.orderedWindows(), function(win)
    if win ~= hs.window.focusedWindow() then
      local option = {
        text = win:title(),
        subText = win:application():title(),
        id = win:id(),
      }

      if win:application():bundleID() then
        option["image"] = hs.image.imageFromAppBundle(win:application():bundleID())
      end

      return option
    end
  end)

  local chooser = hs.chooser.new(function(choice)
    if choice ~= nil then
      local focused = hs.window.focusedWindow()
      local toRead = hs.window.find(choice.id)
      local screen = focused:screen()
      local max = screen:frame()

      local f = focused:frame()
      local t = toRead:frame()

      if hs.eventtap.checkKeyboardModifiers()["alt"] then
        f.w = (max.w * 2) / 3
        f.h = max.h

        t.w = max.w / 3
        t.h = max.h

        focused:setFrame(f)
        toRead:setFrame(t)

        f.x = max.x
        f.y = max.y
        t.x = max.x + ((max.w * 2) / 3)
        t.y = max.y
      else
        f.w = max.w / 2
        f.h = max.h

        t.w = max.w / 2
        t.h = max.h

        focused:setFrame(f)
        toRead:setFrame(t)

        f.x = max.x
        f.y = max.y
        t.x = max.x + (max.w / 2)
        t.y = max.y
      end

      -- disable window placing animation
      focused:setFrame(f)
      toRead:setFrame(t)

      toRead:raise()
      focused:focus()
    end
  end)

  chooser
      :placeholderText("Choose window for 50/50 split. Hold 󰘵  for 70/30.")
      :searchSubText(true)
      :choices(windows)
      :show()
end

function m:bindHotKeys(mapping)
  local spec = {
    split = hs.fnutils.partial(self.split, self),
  }
  hs.spoons.bindHotkeysToSpec(spec, mapping)

  return self
end

return m
