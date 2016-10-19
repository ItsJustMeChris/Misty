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


function isPlayerCasting()
  return UnitChannelInfo("player")
end
function isInRange()
  if inRange(unit) then
    return true
    else return false
    end
end
--is it a talent?  Do I have the talent?
function canCast(ID)
  getSpellCD(ID)
  if myCD == 0 and isPlayerCasting("Soothing Mist") then
    return true
  else if myCD == 0 then
    return true
  else return false
  end
end
end



function getAvgHealth()
  if Group.party[2] == nil then
    return nil else
lowestOneHealth = Group.party[1].HP
lowestTwoHealth = Group.party[2].HP
lowestThreeHealth = Group.party[3].HP
return (lowestOneHealth + lowestTwoHealth + lowestThreeHealth) / 3
  end
end

function averageHealth()
if Group.party[2] == nil then
  return 10000
  else return getAvgHealth()
  end
end



function MistWeaver()
getGroup();
getTank();
getHealer();

--just testing
for i=1,#Group.party do
    lowestHealth = Group.party[1].HP
  lowestTarget = Group.party[1].Unit

end



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
end
