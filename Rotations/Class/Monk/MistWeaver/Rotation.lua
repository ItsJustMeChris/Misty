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


  if canCast(122281) == true and myHealth < 45 and lowestHealth < 70 then
    CastSpellByID(122281, "player")
  end

  if canCast(197908) == true and myMana < 70 or lowestHealth < 80 then
    CastSpellByID(197908, lowestTarget)
  end

  if canCast(115151) == true and not checkBuff(lowestTarget, 119611) and lowestHealth < 95 then
    CastSpellByID(115151, lowestTarget)
  end

  if canCast(116670) == true and checkBuff("player", 197206) and averageHealth() < 75 then
    CastSpellByID(116670, lowestTarget)
  end

  if canCast(116694) == true and lowestHealth < 85 then
    CastSpellByID(116694, lowestTarget)
  end

  if canCast(124682) == true and lowestHealth < 80 then
    CastSpellByID(124682, lowestTarget)
  end

  if canCast(205406) == true and lowestHealth < 90 and GetSpellCount("Sheilun's Gift") >= 5 then
    CastSpellByID(205406, lowestTarget)
  end

  if canCast(198664) == true and averageHealth() < 80 then
    CastSpellByID(198664, lowestTarget)
  end

  if canCast(116670) == true and averageHealth() <= 40 then

    CastSpellByID(116670,lowestTarget)
  end

  if canCast(115310) == true and averageHealth() < 40 then
    CastSpellByID(115310, lowestTarget)
  end

  if canCast(191837) == true and lowestHealth < 30 then
    CastSpellByID(191837, lowestTarget)
  end

  if canCast(124682) == true and lowestHealth < 30 then
    CastSpellByID(124682, lowestTarget)
  end

  if canCast(116849) == true and lowestHealth < 15 then

    CastSpellByID(116849, lowestTarget)
  end

  --End the rotation
end
