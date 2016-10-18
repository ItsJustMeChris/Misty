Toggle = true;
SLASH_MISTY1, SLASH_MISTY2 = '/misty', '/mist';
function handler(msg, editbox)
  toggled();
end
SlashCmdList["MISTY"] = handler;

function toggled()
  if Toggle == true then
    print("off")
    Toggle = false else if
    Toggle == false then
      print("on")
      Toggle = true
    end
  end
end

function Start()
  MainFrame = CreateFrame("FRAME", nil, UIParent)
  MainFrame:SetScript("OnUpdate", MainFrame_OnUpdate)
  MainFrame:SetScript("OnEvent", MainFrame_OnEvent)
  MainFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  MainFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
  print("Hi, I'm misty!")
end

function MainFrame_OnUpdate(self, elapsed)
  if Toggle == true then
    RotationStarter();
  else end
  end

  Start();