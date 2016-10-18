function checkBuff(unit, ID)
  Buff = GetSpellInfo(ID)
  return UnitBuff(unit, Buff)
end

function getSpellCD(ID)
  if GetSpellCooldown(ID) == 0 then
    myCD = 0
    return 0 else
    myCD = GetSpellCooldown(ID)
  end
  return myCD

end

function canCast(ID)
  getSpellCD(ID)
  if myCD == 0 then
    return true
  else return false
  end
end


function MistWeaver()
  getGroup();
  getTank();
  getHealer();

  --just testing
  for i=1,#Group.party do
    lowestTarget = Group.party[i].Unit
    lowestHealth = Group.party[i].HP
  end


  if canCast(122281) and myHealth < 45 then
    CastSpellByID(122281, "player")
  end
  if canCast(197908) and myMana < 70 and lowestHealth < 80 then
    CastSpellByID(197908, lowestTarget)
  end

  if canCast(115151) and not checkBuff(lowestTarget, 119611) and lowestHealth < 95 then
    CastSpellByID(115151, lowestTarget)
  end
  if canCast(116670) and checkBuff("player", 197206) and lowestHealth < 75 then
    CastSpellByID(116670, lowestTarget)
  end
  if not checkBuff(lowestTarget, 124682) and lowestHealth < 80 then
    CastSpellByID(124682, lowestTarget)
  end
  if canCast(124682) and lowestHealth <= 50 then
    CastSpellByID(124682, lowestTarget)
  end
  if canCast(205406) and lowestHealth < 75 then
    CastSpellByID(205406, lowestTarget)
  end

  if canCast(116694) and lowestHealth <= 80 then
    CastSpellByID(116694, lowestTarget)
  end
  if canCast(116670) and lowestHealth <= 60 then

    CastSpellByID(116670,lowestTarget)
    if canCast(115310) and lowestHealth < 40 then
      CastSpellByID(115310, lowestTarget)
    end
  end
  if canCast(191837) and lowestHealth <= 30 then
    CastSpellByID(191837, lowestTarget)
  end
  if canCast(116849) and lowestHealth <= 15 then

    CastSpellByID(116849, lowestTarget)
  end
end
