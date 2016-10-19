--Spells = {}--

--function queContains(ID)
--  for i=1,#Spells do
  --    if Spells[1].spellID == ID then
    --      return true
    --  end
    --end
    --return false
    --end--

    --function clearSpells()
    --if lowestHealth == 100 then
      --  Spells = {}
      --end
      --end--
      --

      --function queSpell(ID)
      --  local groupType = IsInRaid() and "raid" or "party";
      --  queUnit = lowestTarget
      --  if queContains(ID) then
        --  else
        --    table.insert(Spells,{spellID = ID,spellTarget = queUnit})
        --  end
        --return Spells
        --end--

        --function castQue()
        --  if lowestHealth < 100 then
          --spellID = Spells[1].spellID
          --spellTarget = Spells[1].spellTarget--

          --  CastSpellByID(spellID,spellTarget)--

          --end
          --end--

          --function removeQue()
          --table.remove(Spells,1)
          --end--

          --local castSuccess = CreateFrame("Frame")--

          --function castSuccess:OnEvent(event, ...)
          --  if event == "UNIT_SPELLCAST_SUCCEEDED" then
            --    local unit,spellName,_,_,spellID = ...
            --    if lowestHealth < 100 then
              --    if unit=="player" and spellID==Spells[1].spellID then
                --      print("asdfasfasfasdfasdf")
                --      removeQue();
                --    end
                --    end
                --  end
                --end--

                --castSuccess:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
                --castSuccess:SetScript("OnEvent",castSuccess.OnEvent)