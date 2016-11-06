--Check the unit, ID for buff
--if checkBuff(lowestTarget, Enveloping_Mist) then do what you want end


--Gets specc CD to not try to cast a spell with a cooldown such as Spaming Enveloping Mist in its refractory period
function getSpellCD(ID)
  if GetSpellCooldown(ID) == 0 then
    myCD = 0
    return 0 else
    myCD = GetSpellCooldown(ID)
  end
  return myCD
end

--Returns if the player is casting to not inturrupt a channeled spell
function isPlayerCasting()
  return UnitChannelInfo("player")
end

--Does not try to cast on a unit out of range
function isInRange()
  if inRange(unit) then
    return true
  else return false
  end
end

--can I cast a spell?  Checks if the spell is on CD and checks if you're channeling a spell.  Ignores soothing mist (It will take off instead of waiting an hour for it to go away)
--if canCast(Enveloping_Mist) then cast(Enveloping Mist) end
function inRange(unit)
if UnitInRange(unit) then
  return true
  else return false

  end
end
function canCast(ID, unit)
  getSpellCD(ID)
  if combat and myCD == 0 and isPlayerCasting("Soothing Mist") then
    return true
  else if combat and myCD == 0 then
    return true
  else return false
  end
end
end



        LastSpellID = nil
AddEventCallback("UNIT_SPELLCAST_START", function(unitID, spell, rank, lineID, spellID) 
      if UnitIsUnit(unitID, "player") then
        LastSpellID = spellID
        print(LastSpellID)
        print(unitID)
        print(spell)
        LastSpellName = spell
      end
end)

AddEventCallback("UNIT_SPELLCAST_FAILED", function(unitID, spell, rank, lineID, spellID) 
  if unitID == "player" then
        LastSpellID = nil
        LastSpellName = nil
      end
end)

AddEventCallback("UNIT_SPELLCAST_FAILED_QUIET", function(unitID, spell, rank, lineID, spellID) 
    if unitID == "player" then
        LastSpellID = nil
        LastSpellName = nil
      end
end)



function wasNotLastSpell(ID)
if LastSpellID == ID then
  print("asdlkfj")
  return false
  else
   return true
  end
end


--Method to get average health of three units, this is to cast vivify more reliably.  Only if in a group > 1 member
function getAvgHealth()
if Group.party[2] == nil then
  return nil else
  lowestOneHealth = Group.party[1].HP
  lowestTwoHealth = Group.party[2].HP
  lowestThreeHealth = Group.party[3].HP
  return (lowestOneHealth + lowestTwoHealth + lowestThreeHealth) / 3
end
end

--Returns average health, or 10000 if solo, don't need to vivify if solo?
-->>I should fix this from 10000<<
function averageHealth()
if Group.party[2] == nil then
  return 10000
else return getAvgHealth()
end
end

--Returns unit health
function getHealth(unit)
if UnitIsVisible(unit) then
  return 100 * UnitHealth(unit) / UnitHealthMax(unit);
end
end

--Returns unit mana
function getMana(unit)
local groupType = IsInRaid() and "raid" or "party";
if UnitIsVisible(unit) then
  return 100 * UnitMana(unit) / UnitManaMax(unit);
end
end

--Returns units chi (if theyre a monk)
function getChi(unit)
if UnitIsVisible(unit) then
  return 100 * UnitPower(unit, 12)/UnitPowerMax(unit, 12)
end
end




--Returns my health and mana and if i'm in combat
myMana = getMana("player")
myHealth = getHealth("player")
myChi = getChi("player")
inCombat = UnitAffectingCombat("player")
--Returns target health (For Damage/Tank class)
targetHealth = getHealth("target")