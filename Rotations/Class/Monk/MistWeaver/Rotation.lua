--Returns my health and mana and if i'm in combat
myMana = getMana("player")
myHealth = getHealth("player")
myChi = getChi("player")
inCombat = UnitAffectingCombat("player")
--Returns target health (For Damage/Tank class)
targetHealth = getHealth("target")

function MistWeaver()
  table.sort(Group, function(a,b) return UnitHealth(a.Unit) < UnitHealth(b.Unit) end)
  --Returns party members as variables lowestTarget (Being the lowest group member) and lowestHealth (being the lowest group members health)
  local lowestHealth = math.huge
  for i=1,#Group do
    if getHealth(Group[i].Unit)  < lowestHealth then
      lowestTarget = Group[i].Unit
      lowestHealth = getHealth(lowestTarget)
    end
  end

  for i=1,#Group do
    if Group[i].Role == "TANK" then
      tankTarget = Group[i].Unit
      tankHealth = getHealth(tankTarget)
    end
  end



  for i=1,#Group do
    if Group[i].Role == "HEALER" then
      healerTarget = Group[i].Unit
      healerHealth = getHealth(healerTarget)
    end
  end

  --Start the rotation
  function isHeDead()
    for i=1,#Group.party do
      if UnitIsDeadOrGhost(Group[i].Unit) then
        tremove(Group, i)
      end
    end
  end


  if canCast(Renewing_Mist) and lowestHealth <= 99 then
    CastSpellByID(Renewing_Mist, lowestTarget)
  end

  if canCast(Enveoloping_Mist) and tankHealth and tankHealth <= 85 and not checkBuff(tankTarget, Enveoloping_Mist) then
    CastSpellByID(Enveoloping_Mist, lowestTarget)
  end
  if canCast(Enveoloping_Mist) and healerHealth and healerHealth <= 85 and not checkBuff(healerTarget, Enveoloping_Mist) then
    CastSpellByID(Enveoloping_Mist, lowestTarget)
  end
  if canCast(Vivify) and lowestHealth <= 75 and checkBuff("player", Uplifting_Trance) then
    CastSpellByID(Vivify, lowestTarget)
  end
  --End the rotation
end