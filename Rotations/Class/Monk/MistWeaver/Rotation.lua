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
    if Group[i].Role == "DAMAGER" or Group[i].Role == "NONE" and getHealth(Group[i].Unit)  < lowestHealth then
      lowestTarget = Group[i].Unit
      lowestHealth = getHealth(lowestTarget)
    end
  end
  for i=1,#Group do
if thirdUnit then
thirdUnit = Group[3].Unit
thirdHealth = getHealth(thirdUnit)
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
    for i=1,#Group do
      if UnitIsDeadOrGhost(Group[1].Unit) then
        tremove(Group, 1)
      end
    end
  end



  if canCast(Renewing_Mist, lowestTarget) and lowestHealth <= 99 then
    CastSpellByID(Renewing_Mist, lowestTarget)
  end

  if canCast(Enveoloping_Mist, tankTarget) and wasNotLastSpell(Enveoloping_Mist) and tankHealth and tankHealth <= 85 and not checkBuff(tankTarget, Enveoloping_Mist) then
    CastSpellByID(Enveoloping_Mist, tankTarget)
  end
  if canCast(Enveoloping_Mist, healerTarget) and wasNotLastSpell(Enveoloping_Mist) and healerHealth and healerHealth <= 85 and not checkBuff(healerTarget, Enveoloping_Mist) then
    CastSpellByID(Enveoloping_Mist, healerTarget)
  end
  if canCast(Vivify, lowestTarget) and lowestHealth <= 75 and checkBuff("player", Uplifting_Trance) then
    CastSpellByID(Vivify, lowestTarget)
  end

  if canCast(Enveoloping_Mist, lowestTarget) and wasNotLastSpell(Enveoloping_Mist) and lowestHealth >= 65 and lowestHealth <= 75 and not checkBuff(lowestTarget, Enveoloping_Mist)  then
    CastSpellByID(Enveoloping_Mist, lowestTarget)
  end
  if canCast(Effuse, lowestTarget) and lowestHealth >= 70 and lowestHealth <= 80 then
    CastSpellByID(Effuse, lowestTarget)
  end
  if canCast(Zen_Pulse, lowestTarget) and wasNotLastSpell(Zen_Pulse) and lowestHealth >= 50 and lowestHealth <= 70 then
    CastSpellByID(Zen_Pulse, lowestTarget)
  end
  if canCast(Healing_Elixir) and wasNotLastSpell(Healing_Elixir) and myHealth <= 65 and lowestHealth <= 80 then
    CastSpellByID(Healing_Elixir)
  end
  if canCast(Life_Cocoon, tankTarget) and wasNotLastSpell(Life_Cocoon) and tankHealth and tankHealth <= 25 and not checkBuff(tankHealth, Life_Cocoon) then
    CastSpellByID(Life_Cocoon, tankTarget)
  end
  if canCast(Effuse, lowestTarget) and lowestHealth <= 80 then
    CastSpellByID(Effuse, lowestTarget)
  end
    isHeDead()
  --End the rotation
end