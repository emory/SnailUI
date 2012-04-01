-- Tags.lua
-- Written by Snail

oUF.TagEvents['SnailUI:Health'] = 'UNIT_HEALTH'
oUF.TagEvents['SnailUI:HPHealth'] = 'UNIT_HEALTH UNIT_HEAL_PREDICTION'

oUF.Tags['SnailUI:Health'] = function(unit)
	health = trim(GetUnitName(unit, false))

	if InCombatLockdown() or (math.floor(((UnitHealth(unit) / UnitHealthMax(unit)) * 100) + 0.5) < 100) then
		health = math.floor(((UnitHealth(unit) / UnitHealthMax(unit)) * 100) + 0.5) .. '%'
	end

	if UnitIsDead(unit) then
		health = trim(GetUnitName(unit, false), ' | Dead')
	end

	if UnitIsGhost(unit) then
		health = trim(GetUnitName(unit, false), ' | Ghost')
	end

	if UnitIsAFK(unit) then
		health = trim(GetUnitName(unit, false), ' | AFK')
	end

	if not UnitIsConnected(unit) then
		health = trim(GetUnitName(unit, false), ' | D/C')
	end

	return health
end

oUF.Tags['SnailUI:HPHealth'] = function(unit)
	health = trim(GetUnitName(unit, false))

	if InCombatLockdown() or (math.floor(((UnitHealth(unit) / UnitHealthMax(unit)) * 100) + 0.5) < 100) then
		if UnitGetIncomingHeals(unit) then
			health = math.floor((((UnitHealth(unit) + UnitGetIncomingHeals(unit)) / UnitHealthMax(unit)) * 100) + 0.5) .. '%'
		else
			health = math.floor(((UnitHealth(unit) / UnitHealthMax(unit)) * 100) + 0.5) .. '%'
		end
	end

	if UnitIsDead(unit) then
		health = trim(GetUnitName(unit, false), ' | Dead')
	end

	if UnitIsGhost(unit) then
		health = trim(GetUnitName(unit, false), ' | Ghost')
	end

	if UnitIsAFK(unit) then
		health = trim(GetUnitName(unit, false), ' | AFK')
	end

	if not UnitIsConnected(unit) then
		health = trim(GetUnitName(unit, false), ' | D/C')
	end

	return health
end
