  Toggle = true;
  combat = false;
--Toggled check
function toggled()
  if Toggle == true then
    print("[Misty] says:  Aww, ok I'll go away!  Have fun ^.^")
    Toggle = false else if
    Toggle == false then
      print("[Misty] says:  Oh boy, I'm so ready to do this!")
      Toggle = true
    end
  end
end
--Start function, will update values every frame.  
  function Start()
    MainFrame = CreateFrame("FRAME", nil, UIParent)
    MainFrame:SetScript("OnUpdate", MainFrame_OnUpdate)
    MainFrame:SetScript("OnEvent", MainFrame_OnEvent)
    MainFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    MainFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    print("[Misty] says:  Oh, hello!  My name is Misty, I'll take it from here!")
  end
function MainFrame_OnUpdate(self, elapsed)
  if Toggle == true then
    RotationStarter();
    --castQue(); dont need que
  else end
  end
Start();

AddEventCallback("PLAYER_REGEN_DISABLED", function() 
   getGroup()
   print("Zu we are in combat")
   combat = true;
end)


AddEventCallback("PLAYER_REGEN_ENABLED", function() 
   table.wipe(Group)
   print("Zu we are asdf combat")
   combat = false;

end)

--Slash commands for toggle macro
SLASH_MISTY1, SLASH_MISTY2 = '/misty', '/mist';
function handler(msg, editbox)
  toggled();
end
SlashCmdList["MISTY"] = handler;