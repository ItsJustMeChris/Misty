--Returns my health and mana and if i'm in combat
myMana = getMana("player")
myHealth = getHealth("player")
myChi = getChi("player")
inCombat = UnitAffectingCombat("player")
--Returns target health (For Damage/Tank class)
targetHealth = getHealth("target")

function MistWeaver()
  getGroup(); --Gets the group/party
  getTank(); --Gets the tank (broken)
  getHealer(); --Gets the healer(broken)
  --Returns party members as variables lowestTarget (Being the lowest group member) and lowestHealth (being the lowest group members health)
  for i=1,#Group.party do
    lowestTarget = Group.party[1].Unit
    lowestHealth = Group.party[1].HP
  end
  --Start the rotation


  if canCast(Healing_Elixir) == true and myHealth < 45 and lowestHealth < 70 then
    CastSpellByID(Healing_Elixir, "player")
  end

  if canCast(Mana_Tea) == true and myMana < 70 or lowestHealth < 80 then
    CastSpellByID(Mana_Tea, lowestTarget)
  end

  if canCast(Renewing_Mist) == true and not checkBuff(lowestTarget, 119611) and lowestHealth < 95 then
    CastSpellByID(Renewing_Mist, lowestTarget)
  end

  if canCast(Vivify) == true and checkBuff("player", 197206) and averageHealth() < 75 then
    CastSpellByID(Vivify, lowestTarget)
  end

  if canCast(Sheiluns_Gift) == true and lowestHealth < 90 and GetSpellCount("Sheilun's Gift") >= 5 then
    CastSpellByID(Sheiluns_Gift, lowestTarget)
  end

  if canCast(Effuse) == true and lowestHealth > 75 and lowestHealth < 85 then
    CastSpellByID(Effuse, lowestTarget)
  end

  if canCast(Enveoloping_Mist) == true and not checkBuff(lowestTarget, Enveoloping_Mist) and lowestHealth > 40 and lowestHealth < 60 then
    CastSpellByID(Enveoloping_Mist,lowestTarget)
  end

  if canCast(Vivify) == true and lowestHealth > 60 and lowestHealth < 75 then
    CastSpellByID(Vivify, lowestTarget)
  end

  if canCast(ChiJi) == true and averageHealth() < 80 then
    CastSpellByID(ChiJi, lowestTarget)
  end

  if canCast(Vivify) == true and averageHealth() <= 40 then
    CastSpellByID(Vivify,lowestTarget)
  end

  if canCast(Revival) == true and averageHealth() < 40 then
    CastSpellByID(Revival, lowestTarget)
  end

  if canCast(Essence_Font) == true and lowestHealth < 30 then
    CastSpellByID(Essence_Font, lowestTarget)
  end

  if canCast(Life_Cocoon) == true and lowestHealth < 15 then
    CastSpellByID(Life_Cocoon, lowestTarget)
  end

  --End the rotation
end
