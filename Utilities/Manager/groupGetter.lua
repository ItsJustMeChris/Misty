Group = {
  tank = {},
  healer = {},
  party = {},
}

function getHealth(unit)
  local groupType = IsInRaid() and "raid" or "party";
  if UnitIsVisible(unit) then
    return 100 * UnitHealth(unit) / UnitHealthMax(unit);
  end
end
myHealth = getHealth("player")
function getMana(unit)
  local groupType = IsInRaid() and "raid" or "party";
  if UnitIsVisible(unit) then
    return 100 * UnitMana(unit) / UnitManaMax(unit);
  end
end
myMana = getMana("player")


function getGroup()
  local groupType = IsInRaid() and "raid" or "party";
  Group.party = {}
  table.insert(Group.party,{Unit="player",HP=getHealth("player") or 100})
  for i=1, GetNumGroupMembers() do
    local Unit = (groupType .. i)
    if UnitIsVisible(Unit) then
      table.insert(Group.party, {Unit = Unit,HP=getHealth(Unit)})
    end
  end
  table.sort(Group.party, function(low,high) return low.HP < high.HP end)
  return Group.party
end



function getTank()
  local groupType = IsInRaid() and "raid" or "party";
  local playerType = UnitGroupRolesAssigned(unit)
  Group.tank = {}
  for i=1, GetNumGroupMembers() do
    local UnitTank = (groupType .. i)
    if UnitIsVisible(unit) and playerType == "TANK" then
      table.insert(Group.tank, {UnitTank,HP=getHealth(Unit)})
    end
  end
  table.sort(Group.tank, function(low,high) return low.HP < high.HP end)
  return Group.tank
end


function getHealer()
  local groupType = IsInRaid() and "raid" or "party";
  local playerType = UnitGroupRolesAssigned(unit)
  Group.healer = {}
  for i=1, GetNumGroupMembers() do
    local UnitHealer = (groupType .. i)
    if UnitIsVisible(unit) and playerType == "HEALER" then
      table.insert(Group.healer, {UnitHealer,HP=getHealth(unit)})
    end
  end
  table.sort(Group.healer, function(low,high) return low.HP < high.HP end)
  return Group.healer
end
