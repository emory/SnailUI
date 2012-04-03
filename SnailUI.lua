-- Snail.lua
-- Written by Snail

local version = '0.1.1'

oUF:Factory(
	function(self)
		if not isValid(Configuration.theme) then
			settingNotFound('Configuration.lua', 'theme')

			return
		end

 		category = CreateFrame('Frame', nil, UIParent)
 		category.name = 'SnailUI'

 		category.Label1 = category:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
		category.Label1:SetPoint('TOPLEFT', 16, -16)
		category.Label1:SetText('SnailUI ' .. version)

		category.Label2 = category:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
		category.Label2:SetPoint('TOPLEFT', 16, -36)
		category.Label2:SetText('Snail\'s minimalistic UI.')

		generalSubcategory = CreateFrame('Frame', nil, category)
 		generalSubcategory.name = 'General'
 		generalSubcategory.parent = category.name

		generalSubcategory.Label1 = generalSubcategory:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
		generalSubcategory.Label1:SetPoint('TOPLEFT', 16, -16)
		generalSubcategory.Label1:SetText('General')

		generalSubcategory.Label2 = generalSubcategory:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
		generalSubcategory.Label2:SetPoint('TOPLEFT', 16, -36)
		generalSubcategory.Label2:SetText('General options for SnailUI.')

		generalSubcategory.Label3 = generalSubcategory:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
		generalSubcategory.Label3:SetPoint('TOPLEFT', 16, -51)
		generalSubcategory.Label3:SetText('')

		generalSubcategory.Checkbox1 = CreateFrame('CheckButton', nil, generalSubcategory)
		generalSubcategory.Checkbox1:SetPoint('TOPLEFT', 16, -66)
		generalSubcategory.Checkbox1:SetText('Hide all errors.')

 		InterfaceOptions_AddCategory(category)
 		InterfaceOptions_AddCategory(generalSubcategory)

		SlashCmdList['SnailUI'] = function(command)
			InterfaceOptionsFrame_OpenToCategory(category)
		end

		SLASH_SnailUI1 = '/SnailUI'
		SLASH_SnailUI2 = '/SUI'

		if isValid(Configuration.hideAllErrors) then
			UIErrorsFrame:Hide()
		end

		if isValid(Configuration.hideDefaultRaidFrame) then
			CompactRaidFrameManager:UnregisterAllEvents()
			CompactRaidFrameManager:Hide()
			CompactRaidFrameManager:SetScript('OnShow',
				function(self)
					self:Hide()
				end
			)
			
			CompactRaidFrameContainer:UnregisterAllEvents()
			CompactRaidFrameContainer:Hide()
			CompactRaidFrameContainer:SetScript('OnShow',
				function(self)
					self:Hide()
				end
			)
		end

		self:SetActiveStyle('SnailUI')

		if isValid(Configuration[Configuration.theme]['ActionBar2']) then
			MainMenuBar:Hide()
			MainMenuBar:SetScript('OnShow',
				function(self)
					self:Hide()
				end
			)

			for i = 1, NUM_ACTIONBAR_BUTTONS do
				_G['ActionButton' .. i]:SetCheckedTexture(nil)
				_G['ActionButton' .. i]:SetHighlightTexture(nil)
				_G['ActionButton' .. i]:SetNormalTexture(nil)
				_G['ActionButton' .. i]:SetParent(UIParent)
				_G['ActionButton' .. i]:SetPushedTexture(nil)
				_G['ActionButton' .. i]:SetSize(26, 26)

				_G['ActionButton' .. i].ActionButtonBorderBottom = _G['ActionButton' .. i]:CreateTexture(nil, 'LOW')
				_G['ActionButton' .. i].ActionButtonBorderBottom:SetPoint('BOTTOM', 0, -1)
				_G['ActionButton' .. i].ActionButtonBorderBottom:SetSize(28, 1)
				_G['ActionButton' .. i].ActionButtonBorderBottom:SetTexture(0, 0, 0)

				_G['ActionButton' .. i].ActionButtonBorderLeft = _G['ActionButton' .. i]:CreateTexture(nil, 'LOW')
				_G['ActionButton' .. i].ActionButtonBorderLeft:SetPoint('LEFT', -1, 0)
				_G['ActionButton' .. i].ActionButtonBorderLeft:SetSize(1, 26)
				_G['ActionButton' .. i].ActionButtonBorderLeft:SetTexture(0, 0, 0)

				_G['ActionButton' .. i].ActionButtonBorderRight = _G['ActionButton' .. i]:CreateTexture(nil, 'LOW')
				_G['ActionButton' .. i].ActionButtonBorderRight:SetPoint('RIGHT', 1, 0)
				_G['ActionButton' .. i].ActionButtonBorderRight:SetSize(1, 26)
				_G['ActionButton' .. i].ActionButtonBorderRight:SetTexture(0, 0, 0)

				_G['ActionButton' .. i].ActionButtonBorderTop = _G['ActionButton' .. i]:CreateTexture(nil, 'LOW')
				_G['ActionButton' .. i].ActionButtonBorderTop:SetPoint('TOP', 0, 1)
				_G['ActionButton' .. i].ActionButtonBorderTop:SetSize(28, 1)
				_G['ActionButton' .. i].ActionButtonBorderTop:SetTexture(0, 0, 0)

				_G['ActionButton' .. i].Background = _G['ActionButton' .. i]:CreateTexture(nil, 'BACKGROUND')
				_G['ActionButton' .. i].Background:SetPoint('TOPLEFT', -2, 2)
				_G['ActionButton' .. i].Background:SetSize(30, 30)
				
				if isValid(Configuration[Configuration.theme]['ActionBar'].colorByClass) then
					_G['ActionButton' .. i].Background:SetTexture(RAID_CLASS_COLORS[select(2, UnitClass('Player'))].r, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].g, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].b)
				elseif isValid(Configuration[Configuration.theme]['ActionBar'][i].Color) then
					_G['ActionButton' .. i].Background:SetTexture(Configuration[Configuration.theme]['ActionBar'][i].Color.r, Configuration[Configuration.theme]['ActionBar'][i].Color.g, Configuration[Configuration.theme]['ActionBar'][i].Color.b)
				else
					_G['ActionButton' .. i].Background:SetTexture(1, 1, 1)
				end
				
				_G['ActionButton' .. i].Border = _G['ActionButton' .. i]:CreateTexture(nil, 'BACKGROUND')
				_G['ActionButton' .. i].Border:SetPoint('TOPLEFT', -3, 3)
				_G['ActionButton' .. i].Border:SetSize(32, 32)
				_G['ActionButton' .. i].Border:SetTexture(0, 0, 0)

				_G['ActionButton' .. i].icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end
		end

		if isValid(Configuration[Configuration.theme]['FocusFrame']) then
			focusFrame = self:Spawn('Focus')
			focusFrame:SetPoint(Configuration[Configuration.theme]['FocusFrame'].anchor, Configuration[Configuration.theme]['FocusFrame'].x, Configuration[Configuration.theme]['FocusFrame'].y)
		end

		if isValid(Configuration[Configuration.theme]['FocusTargetFrame']) then
			focusTargetFrame = self:Spawn('FocusTarget')
			focusTargetFrame:SetPoint(Configuration[Configuration.theme]['FocusTargetFrame'].anchor, Configuration[Configuration.theme]['FocusTargetFrame'].x, Configuration[Configuration.theme]['FocusTargetFrame'].y)
		end

		if isValid(Configuration[Configuration.theme]['Minimap']) then
			MinimapCluster:Hide()

			minimapFrame = CreateFrame('Minimap', nil, UIParent)
			minimapFrame:SetFrameStrata('HIGH')
			minimapFrame:SetMaskTexture(Configuration[Configuration.theme]['Minimap'].texture)
			minimapFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].anchor, Configuration[Configuration.theme]['Minimap'].x, Configuration[Configuration.theme]['Minimap'].y)
			minimapFrame:SetSize(Configuration[Configuration.theme]['Minimap'].width - 6, Configuration[Configuration.theme]['Minimap'].height - 6)

			minimapFrame:SetScript('OnMouseWheel',
				function(self, zoom)
					if zoom > 0 then
						Minimap_ZoomIn()
					else
						Minimap_ZoomOut()
					end
				end
			)

			minimapFrame.Background = minimapFrame:CreateTexture(nil, 'BACKGROUND')
			minimapFrame.Background:SetPoint('TOPLEFT', -2, 2)
			minimapFrame.Background:SetSize(Configuration[Configuration.theme]['Minimap'].width - 2, Configuration[Configuration.theme]['Minimap'].height - 2)
			
			if isValid(Configuration[Configuration.theme]['Minimap'].colorByClass) then
				minimapFrame.Background:SetTexture(RAID_CLASS_COLORS[select(2, UnitClass('Player'))].r, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].g, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].b)
			elseif isValid(Configuration[Configuration.theme]['Minimap'].Color) then
				minimapFrame.Background:SetTexture(Configuration[Configuration.theme]['Minimap'].Color.r, Configuration[Configuration.theme]['Minimap'].Color.g, Configuration[Configuration.theme]['Minimap'].Color.b)
			else
				minimapFrame.Background:SetTexture(1, 1, 1)
			end

			minimapFrame.Border = minimapFrame:CreateTexture(nil, 'BACKGROUND')
			minimapFrame.Border:SetPoint('TOPLEFT', -3, 3)
			minimapFrame.Border:SetSize(Configuration[Configuration.theme]['Minimap'].width, Configuration[Configuration.theme]['Minimap'].height)
			minimapFrame.Border:SetTexture(0, 0, 0)

			minimapFrame.MinimapBorderBottom = minimapFrame:CreateTexture(nil, 'LOW')
			minimapFrame.MinimapBorderBottom:SetPoint('BOTTOM', 0, -1)
			minimapFrame.MinimapBorderBottom:SetSize(Configuration[Configuration.theme]['Minimap'].width - 4, 1)
			minimapFrame.MinimapBorderBottom:SetTexture(0, 0, 0)

			minimapFrame.MinimapBorderLeft = minimapFrame:CreateTexture(nil, 'LOW')
			minimapFrame.MinimapBorderLeft:SetPoint('LEFT', -1, 0)
			minimapFrame.MinimapBorderLeft:SetSize(1, Configuration[Configuration.theme]['Minimap'].height - 6)
			minimapFrame.MinimapBorderLeft:SetTexture(0, 0, 0)

			minimapFrame.MinimapBorderRight = minimapFrame:CreateTexture(nil, 'LOW')
			minimapFrame.MinimapBorderRight:SetPoint('RIGHT', 1, 0)
			minimapFrame.MinimapBorderRight:SetSize(1, Configuration[Configuration.theme]['Minimap'].height - 6)
			minimapFrame.MinimapBorderRight:SetTexture(0, 0, 0)

			minimapFrame.MinimapBorderTop = minimapFrame:CreateTexture(nil, 'LOW')
			minimapFrame.MinimapBorderTop:SetPoint('TOP', 0, 1)
			minimapFrame.MinimapBorderTop:SetSize(Configuration[Configuration.theme]['Minimap'].width - 4, 1)
			minimapFrame.MinimapBorderTop:SetTexture(0, 0, 0)

			if isValid(Configuration[Configuration.theme]['Minimap'].Clock) then
				TimeManagerClockButton:ClearAllPoints()
				TimeManagerClockButton:GetRegions():Hide()
				TimeManagerClockButton:SetParent(minimapFrame)
				TimeManagerClockButton:SetPoint(Configuration[Configuration.theme]['Minimap'].Clock.anchor, Configuration[Configuration.theme]['Minimap'].Clock.x, Configuration[Configuration.theme]['Minimap'].Clock.y)
				TimeManagerClockTicker:SetFont(Configuration[Configuration.theme]['Minimap'].Clock.font, Configuration[Configuration.theme]['Minimap'].Clock.size, Configuration[Configuration.theme]['Minimap'].Clock.outline)
				TimeManagerClockButton:SetSize(TimeManagerClockTicker:GetWidth(), TimeManagerClockTicker:GetHeight())
				TimeManagerClockTicker:SetPoint('CENTER', TimeManagerClockButton)
				TimeManagerClockTicker:SetShadowOffset(0, 0)

				if isValid(Configuration[Configuration.theme]['Minimap'].Clock.colorByClass) then
					TimeManagerClockTicker:SetTextColor(RAID_CLASS_COLORS[select(2, UnitClass('Player'))].r, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].g, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].b)
				elseif isValid(Configuration[Configuration.theme]['Minimap'].Clock.Color) then
					TimeManagerClockTicker:SetTextColor(Configuration[Configuration.theme]['Minimap'].Color.r, Configuration[Configuration.theme]['Minimap'].Color.g, Configuration[Configuration.theme]['Minimap'].Color.b)
				else
					TimeManagerClockTicker:SetTextColor(1, 1, 1)
				end
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].BattlegroundButton) then
				MiniMapBattlefieldBorder:Hide()
				MiniMapBattlefieldFrame:ClearAllPoints()
				MiniMapBattlefieldFrame:SetParent(minimapFrame)
				MiniMapBattlefieldFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].BattlegroundButton.anchor, Configuration[Configuration.theme]['Minimap'].BattlegroundButton.x, Configuration[Configuration.theme]['Minimap'].BattlegroundButton.y)
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].LFGButton) then
				MiniMapLFGFrame:ClearAllPoints()
				MiniMapLFGFrame:SetHighlightTexture(nil)
				MiniMapLFGFrame:SetParent(minimapFrame)
				MiniMapLFGFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].LFGButton.anchor, Configuration[Configuration.theme]['Minimap'].LFGButton.x, Configuration[Configuration.theme]['Minimap'].LFGButton.y)
				MiniMapLFGFrameBorder:Hide()
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].MailButton) then
				MiniMapMailBorder:Hide()
				MiniMapMailFrame:ClearAllPoints()
				MiniMapMailFrame:SetParent(minimapFrame)
				MiniMapMailFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].MailButton.anchor, Configuration[Configuration.theme]['Minimap'].MailButton.x, Configuration[Configuration.theme]['Minimap'].MailButton.y)
				MiniMapMailIcon:SetTexture([[Interface\Minimap\Tracking\Mailbox]])
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].TrackingButton) then
				MiniMapTracking:ClearAllPoints()
				MiniMapTracking:SetParent(minimapFrame)
				MiniMapTracking:SetPoint(Configuration[Configuration.theme]['Minimap'].TrackingButton.anchor, Configuration[Configuration.theme]['Minimap'].TrackingButton.x, Configuration[Configuration.theme]['Minimap'].TrackingButton.y)
				MiniMapTrackingBackground:Hide()
				MiniMapTrackingButton:SetHighlightTexture(nil)
				MiniMapTrackingButtonBorder:Hide()
				MiniMapTrackingIconOverlay:SetTexture(nil)
			end
		end

		if isValid(Configuration[Configuration.theme]['PetFrame']) then
			petFrame = self:Spawn('Pet')
			petFrame:SetPoint(Configuration[Configuration.theme]['PetFrame'].anchor, Configuration[Configuration.theme]['PetFrame'].x, Configuration[Configuration.theme]['PetFrame'].y)
		end

		if isValid(Configuration[Configuration.theme]['PlayerFrame']) then
			playerFrame = self:Spawn('Player')
			playerFrame:SetPoint(Configuration[Configuration.theme]['PlayerFrame'].anchor, Configuration[Configuration.theme]['PlayerFrame'].x, Configuration[Configuration.theme]['PlayerFrame'].y)
		end

		if isValid(Configuration[Configuration.theme]['RaidFrame']) then
			raidFrame = self:SpawnHeader(nil, nil, nil,
				'columnAnchorPoint', Configuration[Configuration.theme]['RaidFrame'].columnAnchor,
				'columnSpacing', Configuration[Configuration.theme]['RaidFrame'].columnSpacing,
				'groupBy', Configuration[Configuration.theme]['RaidFrame'].groupBy,
				'groupingOrder', Configuration[Configuration.theme]['RaidFrame'].groupOrder,
				'maxColumns', Configuration[Configuration.theme]['RaidFrame'].columns,
				'showParty', Configuration[Configuration.theme]['RaidFrame'].showParty,
				'showPlayer', Configuration[Configuration.theme]['RaidFrame'].showPlayer,
				'showRaid', Configuration[Configuration.theme]['RaidFrame'].showRaid,
				'showSolo', Configuration[Configuration.theme]['RaidFrame'].showSolo,
				'unitsPerColumn', Configuration[Configuration.theme]['RaidFrame'].rows,
				'xOffset', Configuration[Configuration.theme]['RaidFrame'].columnX,
				'yOffset', Configuration[Configuration.theme]['RaidFrame'].columnY
			)

			raidFrame:SetPoint(Configuration[Configuration.theme]['RaidFrame'].anchor, Configuration[Configuration.theme]['RaidFrame'].x, Configuration[Configuration.theme]['RaidFrame'].y)
			raidFrame:Show()
		end

		if isValid(Configuration[Configuration.theme]['TargetFrame']) then
			targetFrame = self:Spawn('Target')
			targetFrame:SetPoint(Configuration[Configuration.theme]['TargetFrame'].anchor, Configuration[Configuration.theme]['TargetFrame'].x, Configuration[Configuration.theme]['TargetFrame'].y)
		end

		if isValid(Configuration[Configuration.theme]['TargetTargetFrame']) then
			targetTargetFrame = self:Spawn('TargetTarget')
			targetTargetFrame:SetPoint(Configuration[Configuration.theme]['TargetTargetFrame'].anchor, Configuration[Configuration.theme]['TargetTargetFrame'].x, Configuration[Configuration.theme]['TargetTargetFrame'].y)
		end
	end
)

oUF:RegisterStyle('SnailUI', 
	function(self, unit)
		unit = unit:gsub('(.)', string.upper, 1)
		
		if isValid(Configuration[Configuration.theme][unit .. 'Frame']) then			
			self.frame = unit
			self:RegisterForClicks('AnyUp')
			self:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].width, Configuration[Configuration.theme][self.frame .. 'Frame'].height)

			self.menu = function(self)
				ToggleDropDownMenu(1, nil, _G[self.unit:gsub('(.)', string.upper, 1) .. 'FrameDropDown'], self, 0, 0)
			end

			self.PostUpdate = function(self)
				if UnitClass(self.unit) then
					self.classColor = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
				else
					self.classColor =
					{
						b = 1,
						g = 1,
						r = 1
					}
				end

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].colorByClass) then
					self.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
				end

				if UnitThreatSituation(self.unit) and (self.frame == 'Raid') and isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].colorByThreatLevel) then
					if UnitThreatSituation(self.unit) > 0 then
						self.threatColor =
						{
							b = 0,
							g = 0,
							r = 0
						}

						self.threatColor.r, self.threatColor.g, self.threatColor.b = GetThreatStatusColor(UnitThreatSituation(self.unit))
						self.Background:SetTexture(self.threatColor.r, self.threatColor.g, self.threatColor.b)
					end
				end

				if self.Castbar then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.colorByClass) then
						self.Castbar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						self.Castbar.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.CPoints then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.colorByClass) then
						self.CPoints.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 5 do
							self.CPoints[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.Health then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.colorByClass) then
						self.Health:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
					end

					if self.Health.Text then
						self.Health.Text:SetTextColor(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.HealPrediction then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.colorByClass) then
						if self.HealPrediction.myBar then
							self.HealPrediction.myBar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end

						if self.HealPrediction.otherBar then
							self.HealPrediction.otherBar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.HolyPower then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.colorByClass) then
						self.HolyPower.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 3 do
							self.HolyPower[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end
				
				if self.Power then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.colorByClass) then
						self.Power:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)

						if self.Power.Text then
							self.Power.Text:SetColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.Portrait then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.colorByClass) then
						self.Portrait.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.Runes then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.colorByClass) then
						self.Runes.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.SoulShards then
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.colorByClass) then
						self.SoulShards.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 3 do
							self.SoulShards[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar) then
				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.healPrediction) then
					self:RegisterEvent('UNIT_HEAL_PREDICTION',
						function(self)
							self.HealPrediction.myBar:SetAlpha(self:GetAlpha() / 2)
							self.HealPrediction.otherBar:SetAlpha(self:GetAlpha() / 2)
						end
					)
				end
			end

			if isValid(Configuration[Configuration.theme]['RaidFrame'].healthThreshold) and (self.frame == 'Raid') then
				self:RegisterEvent('UNIT_HEALTH',
					function(self)
						self:SetAlpha(Configuration.inactiveAlpha)

						if math.floor(((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100) + 0.5) < Configuration[Configuration.theme]['RaidFrame'].healthThreshold then
							if self.inRange then
								self:SetAlpha(1)
							end
						end
					end
				)
			end

			self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', self.PostUpdate)
			self.SpellRange =
			{
				Update = function(self, inRange)
					if isValid(Configuration.inactiveAlpha) then
						if inRange then
							self:SetAlpha(1)
							self.inRange = inRange

							if isValid(Configuration[Configuration.theme]['RaidFrame'].healthThreshold) then
								if (self.frame == 'Raid') and (math.floor(((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100) + 0.5) >= Configuration[Configuration.theme]['RaidFrame'].healthThreshold) then
									self:SetAlpha(Configuration.inactiveAlpha)
								end
							end
						else
							self:SetAlpha(Configuration.inactiveAlpha)
							self.inRange = nil
						end
					end
				end
			}

			self.Background = self:CreateTexture(nil, 'BACKGROUND')
			self.Background:SetPoint('TOPLEFT', 1, -1)
			self.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].height - 2)

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].Color) then
				self.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].Color.b)
			else
				self.Background:SetTexture(1, 1, 1)
			end

			self.Border = self:CreateTexture(nil, 'BACKGROUND')
			self.Border:SetPoint('TOPLEFT')
			self.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].width, Configuration[Configuration.theme][self.frame .. 'Frame'].height)
			self.Border:SetTexture(0, 0, 0)

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar) then
				self.Castbar = CreateFrame('StatusBar', nil, self)
				self.Castbar:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.orientation)
				self.Castbar:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.y)
				self.Castbar:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.width - 6, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.height - 6)
				self.Castbar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.texture)

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color) then
					self.Castbar:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.b)
				else
					self.Castbar:SetStatusBarColor(1, 1, 1)
				end

				self.Castbar.Background = self.Castbar:CreateTexture(nil, 'BACKGROUND')
				self.Castbar.Background:SetPoint('TOPLEFT', -2, 2)
				self.Castbar.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.height - 2)
				
				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color) then
					self.Castbar.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.Color.b)
				else
					self.Castbar.Background:SetTexture(1, 1, 1)
				end
				
				self.Castbar.Border = self.Castbar:CreateTexture(nil, 'BACKGROUND')
				self.Castbar.Border:SetPoint('TOPLEFT', -3, 3)
				self.Castbar.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.height)
				self.Castbar.Border:SetTexture(0, 0, 0)

				self.Castbar.CastingBarBorder = self.Castbar:CreateTexture(nil, 'LOW')
				self.Castbar.CastingBarBorder:SetPoint('TOPLEFT', -1, 1)
				self.Castbar.CastingBarBorder:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.width - 4, Configuration[Configuration.theme][self.frame .. 'Frame'].CastingBar.height - 4)
				self.Castbar.CastingBarBorder:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'ROGUE' then
					self.CPoints = CreateFrame('Frame', nil, self)
					self.CPoints:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.y)
					self.CPoints:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.height - 2)

					self.CPoints.Background = self.CPoints:CreateTexture(nil, 'BACKGROUND')
					self.CPoints.Background:SetPoint('TOPLEFT')
					self.CPoints.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.Color) then
						self.CPoints.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.Color.b)
					else
						self.CPoints.Background:SetTexture(1, 1, 1)
					end

					self.CPoints.Border = self.CPoints:CreateTexture(nil, 'BACKGROUND')
					self.CPoints.Border:SetPoint('TOPLEFT', -1, 1)
					self.CPoints.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar.height)
					self.CPoints.Border:SetTexture(0, 0, 0)

					for i = 1, 5 do
						self.CPoints[i] = CreateFrame('StatusBar', nil, self)
						self.CPoints[i]:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].orientation)
						self.CPoints[i]:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].anchor, self.CPoints, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].x, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].y)
						self.CPoints[i]:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].height - 2)
						self.CPoints[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].texture)

						if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].Color) then
							self.CPoints[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].Color.b)
						else
							self.CPoints[i]:SetStatusBarColor(1, 1, 1)
						end

						self.CPoints[i].Border = self.CPoints:CreateTexture(nil, 'LOW')
						self.CPoints[i].Border:SetPoint('TOPLEFT', self.CPoints[i], -1, 1)
						self.CPoints[i].Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].width, Configuration[Configuration.theme][self.frame .. 'Frame'].ComboPointBar[i].height)
						self.CPoints[i].Border:SetTexture(0, 0, 0)
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar) then
				self.Health = CreateFrame('StatusBar', nil, self)
				self.Health.frequentUpdates = true
				self.Health:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.orientation)
				self.Health:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.y)
				self.Health:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.height - 2)
				self.Health:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.texture)

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color) then
					self.Health:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.b)
				else
					self.Health:SetStatusBarColor(1, 1, 1)
				end
				
				self.Health.Border = self.Health:CreateTexture(nil, 'BACKGROUND')
				self.Health.Border:SetPoint('TOPLEFT', -1, 1)
				self.Health.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.height)
				self.Health.Border:SetTexture(0, 0, 0)

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text) then
					self.Health.Text = self.Health:CreateFontString(nil, 'OVERLAY')
					self.Health.Text.frequentUpdates = true
					self.Health.Text:SetFont(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.font, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.size, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.outline)
					self.Health.Text:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.x, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text.y)
				end

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.healPrediction) then
					self.HealPrediction =
					{
						maxOverflow = 1,
						myBar = CreateFrame('StatusBar', nil, self),
						otherBar = CreateFrame('StatusBar', nil, self)
					}

					self.HealPrediction.myBar:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.orientation)
					self.HealPrediction.myBar:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
					self.HealPrediction.myBar:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
					self.HealPrediction.myBar:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.height - 2)
					self.HealPrediction.myBar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.texture)

					self.HealPrediction.otherBar:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.orientation)
					self.HealPrediction.otherBar:SetPoint('TOPLEFT', self.HealPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
					self.HealPrediction.otherBar:SetPoint('BOTTOMLEFT', self.HealPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
					self.HealPrediction.otherBar:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.height - 2)
					self.HealPrediction.otherBar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.texture)

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color) then
						self.HealPrediction.myBar:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.b)
						self.HealPrediction.otherBar:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Color.b)
					else
						self.HealPrediction.myBar:SetStatusBarColor(1, 1, 1)
						self.HealPrediction.otherBar:SetStatusBarColor(1, 1, 1)
					end

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text) then
						self:Tag(self.Health.Text, '[SnailUI:HPHealth]')
					end
				else
					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HealthBar.Text) then
						self:Tag(self.Health.Text, '[SnailUI:Health]')
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'PALADIN' then
					self.HolyPower = CreateFrame('Frame', nil, self)
					self.HolyPower:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.y)
					self.HolyPower:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.height - 2)

					self.HolyPower.Background = self.HolyPower:CreateTexture(nil, 'BACKGROUND')
					self.HolyPower.Background:SetPoint('TOPLEFT')
					self.HolyPower.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.Color) then
						self.HolyPower.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.Color.b)
					else
						self.HolyPower.Background:SetTexture(1, 1, 1)
					end

					self.HolyPower.Border = self.HolyPower:CreateTexture(nil, 'BACKGROUND')
					self.HolyPower.Border:SetPoint('TOPLEFT', -1, 1)
					self.HolyPower.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar.height)
					self.HolyPower.Border:SetTexture(0, 0, 0)

					for i = 1, 3 do
						self.HolyPower[i] = CreateFrame('StatusBar', nil, self)
						self.HolyPower[i]:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].orientation)
						self.HolyPower[i]:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].anchor, self.HolyPower, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].x, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].y )
						self.HolyPower[i]:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].height - 2)
						self.HolyPower[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].texture)

						if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].Color) then
							self.HolyPower[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].Color.b)
						else
							self.HolyPower[i]:SetStatusBarColor(1, 1, 1)
						end

						self.HolyPower[i].Border = self.HolyPower:CreateTexture(nil, 'LOW')
						self.HolyPower[i].Border:SetPoint('TOPLEFT', self.HolyPower[i], -1, 1)
						self.HolyPower[i].Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].width, Configuration[Configuration.theme][self.frame .. 'Frame'].HolyPowerBar[i].height)
						self.HolyPower[i].Border:SetTexture(0, 0, 0)
					end
				end
			end
			
			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait) then
				self.Portrait = CreateFrame('PlayerModel', nil, self)
				self.Portrait:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.x, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.y)
				self.Portrait:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.height - 2)
				
				self.Portrait.Background = self.Portrait:CreateTexture(nil, 'BACKGROUND')
				self.Portrait.Background:SetPoint('TOPLEFT')
				self.Portrait.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.height - 2)

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.Color) then
					self.Portrait.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.Color.b)
				else
					self.Portrait.Background:SetTexture(1, 1, 1)
				end

				self.Portrait.Border = self.Portrait:CreateTexture(nil, 'BACKGROUND')
				self.Portrait.Border:SetPoint('TOPLEFT', -1, 1)
				self.Portrait.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.width, Configuration[Configuration.theme][self.frame .. 'Frame'].Portrait.height)
				self.Portrait.Border:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar) then
				self.Power = CreateFrame('StatusBar', nil, self)
				self.Power.frequentUpdates = true
				self.Power:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.orientation)
				self.Power:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.y)
				self.Power:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.height - 2)
				self.Power:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.texture)

				if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.Color) then
					self.Power:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.Color.b)
				else
					self.Power:SetStatusBarColor(1, 1, 1)
				end
				
				self.Power.Border = self.Power:CreateTexture(nil, 'BACKGROUND')
				self.Power.Border:SetPoint('TOPLEFT', -1, 1)
				self.Power.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].PowerBar.height)
				self.Power.Border:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'DEATHKNIGHT' then
					self.Runes = CreateFrame('Frame', nil, self)
					self.Runes:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.y)
					self.Runes:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.height - 2)

					self.Runes.Background = self.Runes:CreateTexture(nil, 'BACKGROUND')
					self.Runes.Background:SetPoint('TOPLEFT')
					self.Runes.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.Color) then
						self.Runes.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.Color.b)
					else
						self.Runes.Background:SetTexture(1, 1, 1)
					end

					self.Runes.Border = self.Runes:CreateTexture(nil, 'BACKGROUND')
					self.Runes.Border:SetPoint('TOPLEFT', -1, 1)
					self.Runes.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar.height)
					self.Runes.Border:SetTexture(0, 0, 0)

					for i = 1, 6 do
						self.Runes[i] = CreateFrame('StatusBar', nil, self)
						self.Runes[i]:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].orientation)
						self.Runes[i]:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].anchor, self.Runes, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].x, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].y)
						self.Runes[i]:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].height - 2)
						self.Runes[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].texture)

						if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].Color) then
							self.Runes[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].Color.b)
						else
							self.Runes[i]:SetStatusBarColor(1, 1, 1)
						end

						self.Runes[i].Border = self.Runes:CreateTexture(nil, 'LOW')
						self.Runes[i].Border:SetPoint('TOPLEFT', self.Runes[i], -1, 1)
						self.Runes[i].Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].width, Configuration[Configuration.theme][self.frame .. 'Frame'].RuneBar[i].height)
						self.Runes[i].Border:SetTexture(0, 0, 0)
					end

					self.Runes[3], self.Runes[4], self.Runes[5], self.Runes[6] = self.Runes[5], self.Runes[6], self.Runes[3], self.Runes[4]
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'WARLOCK' then
					self.SoulShards = CreateFrame('Frame', nil, self)
					self.SoulShards:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.anchor, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.x, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.y)
					self.SoulShards:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.height - 2)

					self.SoulShards.Background = self.SoulShards:CreateTexture(nil, 'BACKGROUND')
					self.SoulShards.Background:SetPoint('TOPLEFT')
					self.SoulShards.Background:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.Color) then
						self.SoulShards.Background:SetTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.Color.b)
					else
						self.SoulShards.Background:SetTexture(1, 1, 1)
					end

					self.SoulShards.Border = self.SoulShards:CreateTexture(nil, 'BACKGROUND')
					self.SoulShards.Border:SetPoint('TOPLEFT', -1, 1)
					self.SoulShards.Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.width, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar.height)
					self.SoulShards.Border:SetTexture(0, 0, 0)

					for i = 1, 3 do
						self.SoulShards[i] = CreateFrame('StatusBar', nil, self)
						self.SoulShards[i]:SetOrientation(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].orientation)
						self.SoulShards[i]:SetPoint(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].anchor, self.SoulShards, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].x, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].y)
						self.SoulShards[i]:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].width - 2, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].height - 2)
						self.SoulShards[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].texture)

						if isValid(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].Color) then
							self.SoulShards[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].Color.r, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].Color.g, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].Color.b)
						else
							self.SoulShards[i]:SetStatusBarColor(1, 1, 1)
						end

						self.SoulShards[i].Border = self.SoulShards:CreateTexture(nil, 'LOW')
						self.SoulShards[i].Border:SetPoint('TOPLEFT', self.SoulShards[i], -1, 1)
						self.SoulShards[i].Border:SetSize(Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].width, Configuration[Configuration.theme][self.frame .. 'Frame'].SoulShardBar[i].height)
						self.SoulShards[i].Border:SetTexture(0, 0, 0)
					end
				end
			end
		end
	end
)
