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

		generalSubcategory = CreateFrame('Frame', nil, category)2
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

		if isValid(Configuration[Configuration.theme]['Raid']) then
			raidFrame = self:SpawnHeader(nil, nil, nil,
				'columnAnchorPoint', Configuration[Configuration.theme]['Raid'].columnAnchor,
				'columnSpacing', Configuration[Configuration.theme]['Raid'].columnSpacing,
				'groupBy', Configuration[Configuration.theme]['Raid'].groupBy,
				'groupingOrder', Configuration[Configuration.theme]['Raid'].groupOrder,
				'maxColumns', Configuration[Configuration.theme]['Raid'].columns,
				'showParty', Configuration[Configuration.theme]['Raid'].showParty,
				'showPlayer', Configuration[Configuration.theme]['Raid'].showPlayer,
				'showRaid', Configuration[Configuration.theme]['Raid'].showRaid,
				'showSolo', Configuration[Configuration.theme]['Raid'].showSolo,
				'unitsPerColumn', Configuration[Configuration.theme]['Raid'].rows,
				'xOffset', Configuration[Configuration.theme]['Raid'].columnX,
				'yOffset', Configuration[Configuration.theme]['Raid'].columnY
			)

			raidFrame:SetPoint(Configuration[Configuration.theme]['Raid'].anchor, Configuration[Configuration.theme]['Raid'].x, Configuration[Configuration.theme]['Raid'].y)
			raidFrame:Show()
		end

		--MainMenuBar:Hide()

		for i = 1, NUM_ACTIONBAR_BUTTONS do
			--_G['ActionButton' .. i]:SetParent(UIParent)
		end

		for i = 1, NUM_PET_ACTION_SLOTS do
			--_G['PetActionButton' .. i]:SetParent(UIParent)
		end

		if isValid(Configuration[Configuration.theme]['Bag']) then
			bagFrame = CreateFrame('Frame', nil, UIParent)
			bagFrame:Hide()
			bagFrame:SetPoint(Configuration[Configuration.theme]['Bag'].anchor, Configuration[Configuration.theme]['Bag'].x, Configuration[Configuration.theme]['Bag'].y)
			bagFrame:SetSize(Configuration[Configuration.theme]['Bag'].width, Configuration[Configuration.theme]['Bag'].height)

			bagFrame.Background = bagFrame:CreateTexture(nil, 'BACKGROUND')
			bagFrame.Background:SetPoint('TOPLEFT', 1, -1)
			bagFrame.Background:SetSize(Configuration[Configuration.theme]['Bag'].width - 2, Configuration[Configuration.theme]['Bag'].height - 2)

			if isValid(Configuration[Configuration.theme]['Bag'].colorByClass) then
				bagFrame.Background:SetTexture(RAID_CLASS_COLORS[select(2, UnitClass('Player'))].r, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].g, RAID_CLASS_COLORS[select(2, UnitClass('Player'))].b)
			elseif isValid(Configuration[Configuration.theme]['Bag'].Color) then
				bagFrame.Background:SetTexture(Configuration[Configuration.theme]['Bag'].Color.r, Configuration[Configuration.theme]['Bag'].Color.g, Configuration[Configuration.theme]['Bag'].Color.b)
			else
				bagFrame.Background:SetTexture(1, 1, 1)
			end

			bagFrame.Border = bagFrame:CreateTexture(nil, 'BACKGROUND')
			bagFrame.Border:SetPoint('TOPLEFT')
			bagFrame.Border:SetSize(Configuration[Configuration.theme]['Bag'].width, Configuration[Configuration.theme]['Bag'].height)
			bagFrame.Border:SetTexture(0, 0, 0)

			for i = 1, NUM_BAG_FRAMES + 1 do
				if i == 1 then
				for j = 1, MAX_CONTAINER_ITEMS do
					_G['ContainerFrame' .. i .. 'Item' .. j]:SetParent(bagFrame)

					if j == 1 then
						_G['ContainerFrame' .. i .. 'Item' .. j]:SetPoint('LEFT')
					else
						_G['ContainerFrame' .. i .. 'Item' .. j]:SetPoint('LEFT', _G['ContainerFrame' .. i .. 'Item' .. j - 1], 'LEFT')
					end
				end
				end

				if i == 1 then
					ContainerFrame1:SetScript('OnHide',
						function(self)
							bagFrame:Hide()
						end
					)

					ContainerFrame1:SetScript('OnShow',
						function(self)
							bagFrame:Show()
						end
					)
				else
					_G['ContainerFrame' .. i]:SetScript('OnShow',
						function(self)
							self:Hide()
						end
					)
				end
			end
		end

		if isValid(Configuration[Configuration.theme]['Focus']) then
			focusFrame = self:Spawn('Focus')
			
			if isValid(Configuration[Configuration.theme]['Focus'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				focusFrame:SetPoint(Configuration[Configuration.theme]['Focus'].anchor2, raidFrame, Configuration[Configuration.theme]['Focus'].anchor, Configuration[Configuration.theme]['Focus'].x, Configuration[Configuration.theme]['Focus'].y)
			else
				focusFrame:SetPoint(Configuration[Configuration.theme]['Focus'].anchor, Configuration[Configuration.theme]['Focus'].x, Configuration[Configuration.theme]['Focus'].y)
			end
		end

		if isValid(Configuration[Configuration.theme]['Focustarget']) then
			focusFrame = self:Spawn('Focustarget')
			
			if isValid(Configuration[Configuration.theme]['Focustarget'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				focusFrame:SetPoint(Configuration[Configuration.theme]['Focustarget'].anchor2, raidFrame, Configuration[Configuration.theme]['Focustarget'].anchor, Configuration[Configuration.theme]['Focustarget'].x, Configuration[Configuration.theme]['Focustarget'].y)
			else
				focusFrame:SetPoint(Configuration[Configuration.theme]['Focustarget'].anchor, Configuration[Configuration.theme]['Focustarget'].x, Configuration[Configuration.theme]['Focustarget'].y)
			end
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

			if isValid(Configuration[Configuration.theme]['Minimap'].Battleground) then
				MiniMapBattlefieldBorder:Hide()
				MiniMapBattlefieldFrame:ClearAllPoints()
				MiniMapBattlefieldFrame:SetParent(minimapFrame)
				MiniMapBattlefieldFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].Battleground.anchor, Configuration[Configuration.theme]['Minimap'].Battleground.x, Configuration[Configuration.theme]['Minimap'].Battleground.y)
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].LFG) then
				MiniMapLFGFrame:ClearAllPoints()
				MiniMapLFGFrame:SetHighlightTexture(nil)
				MiniMapLFGFrame:SetParent(minimapFrame)
				MiniMapLFGFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].LFG.anchor, Configuration[Configuration.theme]['Minimap'].LFG.x, Configuration[Configuration.theme]['Minimap'].LFG.y)
				MiniMapLFGFrameBorder:Hide()
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].Mail) then
				MiniMapMailBorder:Hide()
				MiniMapMailFrame:ClearAllPoints()
				MiniMapMailFrame:SetParent(minimapFrame)
				MiniMapMailFrame:SetPoint(Configuration[Configuration.theme]['Minimap'].Mail.anchor, Configuration[Configuration.theme]['Minimap'].Mail.x, Configuration[Configuration.theme]['Minimap'].Mail.y)
				MiniMapMailIcon:SetTexture([[Interface\Minimap\Tracking\Mailbox]])
			end

			if isValid(Configuration[Configuration.theme]['Minimap'].Tracking) then
				MiniMapTracking:ClearAllPoints()
				MiniMapTracking:SetParent(minimapFrame)
				MiniMapTracking:SetPoint(Configuration[Configuration.theme]['Minimap'].Tracking.anchor, Configuration[Configuration.theme]['Minimap'].Tracking.x, Configuration[Configuration.theme]['Minimap'].Tracking.y)
				MiniMapTrackingBackground:Hide()
				MiniMapTrackingButton:SetHighlightTexture(nil)
				MiniMapTrackingButtonBorder:Hide()
				MiniMapTrackingIconOverlay:SetTexture(nil)
			end
		end

		if isValid(Configuration[Configuration.theme]['Pet']) then
			petFrame = self:Spawn('Pet')
			
			if isValid(Configuration[Configuration.theme]['Pet'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				petFrame:SetPoint(Configuration[Configuration.theme]['Pet'].anchor2, raidFrame, Configuration[Configuration.theme]['Pet'].anchor, Configuration[Configuration.theme]['Pet'].x, Configuration[Configuration.theme]['Pet'].y)
			else
				petFrame:SetPoint(Configuration[Configuration.theme]['Pet'].anchor, Configuration[Configuration.theme]['Pet'].x, Configuration[Configuration.theme]['Pet'].y)
			end
		end

		if isValid(Configuration[Configuration.theme]['Targettarget']) then
			targetTargetFrame = self:Spawn('Targettarget')
			
			if isValid(Configuration[Configuration.theme]['Targettarget'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				targetTargetFrame:SetPoint(Configuration[Configuration.theme]['Targettarget'].anchor2, raidFrame, Configuration[Configuration.theme]['Targettarget'].anchor, Configuration[Configuration.theme]['Targettarget'].x, Configuration[Configuration.theme]['Targettarget'].y)
			else
				targetTargetFrame:SetPoint(Configuration[Configuration.theme]['Targettarget'].anchor, Configuration[Configuration.theme]['Targettarget'].x, Configuration[Configuration.theme]['Targettarget'].y)
			end
		end

		if isValid(Configuration[Configuration.theme]['Player']) then
			playerFrame = self:Spawn('Player')

			if isValid(Configuration[Configuration.theme]['Player'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				playerFrame:SetPoint(Configuration[Configuration.theme]['Player'].anchor2, raidFrame, Configuration[Configuration.theme]['Player'].anchor, Configuration[Configuration.theme]['Player'].x, Configuration[Configuration.theme]['Player'].y)
			else
				playerFrame:SetPoint(Configuration[Configuration.theme]['Player'].anchor, Configuration[Configuration.theme]['Player'].x, Configuration[Configuration.theme]['Player'].y)
			end
		end

		if isValid(Configuration[Configuration.theme]['Target']) then
			targetFrame = self:Spawn('Target')
			
			if isValid(Configuration[Configuration.theme]['Target'].anchorToRaidFrame) and isValid(Configuration[Configuration.theme]['Raid']) then
				targetFrame:SetPoint(Configuration[Configuration.theme]['Target'].anchor2, raidFrame, Configuration[Configuration.theme]['Target'].anchor, Configuration[Configuration.theme]['Target'].x, Configuration[Configuration.theme]['Target'].y)
			else
				targetFrame:SetPoint(Configuration[Configuration.theme]['Target'].anchor, Configuration[Configuration.theme]['Target'].x, Configuration[Configuration.theme]['Target'].y)
			end
		end
	end
)

oUF:RegisterStyle('SnailUI', 
	function(self, unit)
		unit = unit:gsub('(.)', string.upper, 1)
		
		if isValid(Configuration[Configuration.theme][unit]) then			
			self.frame = unit
			self:RegisterForClicks('AnyUp')
			self:SetSize(Configuration[Configuration.theme][self.frame].width, Configuration[Configuration.theme][self.frame].height)

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

				if isValid(Configuration[Configuration.theme][self.frame].colorByClass) then
					self.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
				end

				if UnitThreatSituation(self.unit) and (self.frame == 'Raid') and isValid(Configuration[Configuration.theme][self.frame].colorByThreatLevel) then
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
					if isValid(Configuration[Configuration.theme][self.frame].Cast.colorByClass) then
						self.Castbar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						self.Castbar.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.CPoints then
					if isValid(Configuration[Configuration.theme][self.frame].ComboPoints.colorByClass) then
						self.CPoints.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 5 do
							self.CPoints[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.Health then
					if isValid(Configuration[Configuration.theme][self.frame].Health.colorByClass) then
						self.Health:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
					end

					if self.Health.Text then
						self.Health.Text:SetTextColor(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.HealPrediction then
					if isValid(Configuration[Configuration.theme][self.frame].Health.colorByClass) then
						if self.HealPrediction.myBar then
							self.HealPrediction.myBar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end

						if self.HealPrediction.otherBar then
							self.HealPrediction.otherBar:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.HolyPower then
					if isValid(Configuration[Configuration.theme][self.frame].HolyPower.colorByClass) then
						self.HolyPower.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 3 do
							self.HolyPower[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end
				
				if self.Power then
					if isValid(Configuration[Configuration.theme][self.frame].Power.colorByClass) then
						self.Power:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)

						if self.Power.Text then
							self.Power.Text:SetColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end

				if self.Portrait then
					if isValid(Configuration[Configuration.theme][self.frame].Portrait.colorByClass) then
						self.Portrait.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.Runes then
					if isValid(Configuration[Configuration.theme][self.frame].Runes.colorByClass) then
						self.Runes.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)
					end
				end

				if self.SoulShards then
					if isValid(Configuration[Configuration.theme][self.frame].SoulShards.colorByClass) then
						self.SoulShards.Background:SetTexture(self.classColor.r, self.classColor.g, self.classColor.b)

						for i = 1, 3 do
							self.SoulShards[i]:SetStatusBarColor(self.classColor.r, self.classColor.g, self.classColor.b)
						end
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame].Health) then
				if isValid(Configuration[Configuration.theme][self.frame].Health.healPrediction) then
					self:RegisterEvent('UNIT_HEAL_PREDICTION',
						function(self)
							self.HealPrediction.myBar:SetAlpha(self:GetAlpha() / 2)
							self.HealPrediction.otherBar:SetAlpha(self:GetAlpha() / 2)
						end
					)
				end
			end

			if isValid(Configuration[Configuration.theme]['Raid'].healthThreshold) and (self.frame == 'Raid') then
				self:RegisterEvent('UNIT_HEALTH',
					function(self)
						self:SetAlpha(Configuration.inactiveAlpha)

						if math.floor(((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100) + 0.5) < Configuration[Configuration.theme]['Raid'].healthThreshold then
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

							if isValid(Configuration[Configuration.theme]['Raid'].healthThreshold) then
								if (self.frame == 'Raid') and (math.floor(((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100) + 0.5) >= Configuration[Configuration.theme]['Raid'].healthThreshold) then
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
			self.Background:SetSize(Configuration[Configuration.theme][self.frame].width - 2, Configuration[Configuration.theme][self.frame].height - 2)

			if isValid(Configuration[Configuration.theme][self.frame].Color) then
				self.Background:SetTexture(Configuration[Configuration.theme][self.frame].Color.r, Configuration[Configuration.theme][self.frame].Color.g, Configuration[Configuration.theme][self.frame].Color.b)
			else
				self.Background:SetTexture(1, 1, 1)
			end

			self.Border = self:CreateTexture(nil, 'BACKGROUND')
			self.Border:SetPoint('TOPLEFT')
			self.Border:SetSize(Configuration[Configuration.theme][self.frame].width, Configuration[Configuration.theme][self.frame].height)
			self.Border:SetTexture(0, 0, 0)

			if isValid(Configuration[Configuration.theme][self.frame].Cast) then
				self.Castbar = CreateFrame('StatusBar', nil, self)
				self.Castbar:SetOrientation(Configuration[Configuration.theme][self.frame].Cast.orientation)
				self.Castbar:SetPoint(Configuration[Configuration.theme][self.frame].Cast.anchor, Configuration[Configuration.theme][self.frame].Cast.x, Configuration[Configuration.theme][self.frame].Cast.y)
				self.Castbar:SetSize(Configuration[Configuration.theme][self.frame].Cast.width - 6, Configuration[Configuration.theme][self.frame].Cast.height - 6)
				self.Castbar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Cast.texture)

				if isValid(Configuration[Configuration.theme][self.frame].Cast.Color) then
					self.Castbar:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Cast.Color.r, Configuration[Configuration.theme][self.frame].Cast.Color.g, Configuration[Configuration.theme][self.frame].Cast.Color.b)
				else
					self.Castbar:SetStatusBarColor(1, 1, 1)
				end

				self.Castbar.Background = self.Castbar:CreateTexture(nil, 'BACKGROUND')
				self.Castbar.Background:SetPoint('TOPLEFT', -2, 2)
				self.Castbar.Background:SetSize(Configuration[Configuration.theme][self.frame].Cast.width - 2, Configuration[Configuration.theme][self.frame].Cast.height - 2)
				
				if isValid(Configuration[Configuration.theme][self.frame].Cast.Color) then
					self.Castbar.Background:SetTexture(Configuration[Configuration.theme][self.frame].Cast.Color.r, Configuration[Configuration.theme][self.frame].Cast.Color.g, Configuration[Configuration.theme][self.frame].Cast.Color.b)
				else
					self.Castbar.Background:SetTexture(1, 1, 1)
				end
				
				self.Castbar.Border = self.Castbar:CreateTexture(nil, 'BACKGROUND')
				self.Castbar.Border:SetPoint('TOPLEFT', -3, 3)
				self.Castbar.Border:SetSize(Configuration[Configuration.theme][self.frame].Cast.width, Configuration[Configuration.theme][self.frame].Cast.height)
				self.Castbar.Border:SetTexture(0, 0, 0)

				self.Castbar.CastBorder = self.Castbar:CreateTexture(nil, 'LOW')
				self.Castbar.CastBorder:SetPoint('TOPLEFT', -1, 1)
				self.Castbar.CastBorder:SetSize(Configuration[Configuration.theme][self.frame].Cast.width - 4, Configuration[Configuration.theme][self.frame].Cast.height - 4)
				self.Castbar.CastBorder:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame].ComboPoints) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'ROGUE' then
					self.CPoints = CreateFrame('Frame', nil, self)
					self.CPoints:SetPoint(Configuration[Configuration.theme][self.frame].ComboPoints.anchor, Configuration[Configuration.theme][self.frame].ComboPoints.x, Configuration[Configuration.theme][self.frame].ComboPoints.y)
					self.CPoints:SetSize(Configuration[Configuration.theme][self.frame].ComboPoints.width - 2, Configuration[Configuration.theme][self.frame].ComboPoints.height - 2)

					self.CPoints.Background = self.CPoints:CreateTexture(nil, 'BACKGROUND')
					self.CPoints.Background:SetPoint('TOPLEFT')
					self.CPoints.Background:SetSize(Configuration[Configuration.theme][self.frame].ComboPoints.width - 2, Configuration[Configuration.theme][self.frame].ComboPoints.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame].ComboPoints.Color) then
						self.CPoints.Background:SetTexture(Configuration[Configuration.theme][self.frame].ComboPoints.Color.r, Configuration[Configuration.theme][self.frame].ComboPoints.Color.g, Configuration[Configuration.theme][self.frame].ComboPoints.Color.b)
					else
						self.CPoints.Background:SetTexture(1, 1, 1)
					end

					self.CPoints.Border = self.CPoints:CreateTexture(nil, 'BACKGROUND')
					self.CPoints.Border:SetPoint('TOPLEFT', -1, 1)
					self.CPoints.Border:SetSize(Configuration[Configuration.theme][self.frame].ComboPoints.width, Configuration[Configuration.theme][self.frame].ComboPoints.height)
					self.CPoints.Border:SetTexture(0, 0, 0)

					for i = 1, 5 do
						self.CPoints[i] = CreateFrame('StatusBar', nil, self)
						self.CPoints[i]:SetSize(Configuration[Configuration.theme][self.frame].ComboPoints[i].width - 2, Configuration[Configuration.theme][self.frame].ComboPoints[i].height - 2)
						self.CPoints[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].ComboPoints.texture)

						if isValid(Configuration[Configuration.theme][self.frame].ComboPoints[i].Color) then
							self.CPoints[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame].ComboPoints[i].Color.r, Configuration[Configuration.theme][self.frame].ComboPoints[i].Color.g, Configuration[Configuration.theme][self.frame].ComboPoints[i].Color.b)
						else
							self.CPoints[i]:SetStatusBarColor(1, 1, 1)
						end

						self.CPoints[i].Border = self.CPoints:CreateTexture(nil, 'LOW')
						self.CPoints[i].Border:SetPoint('TOPLEFT', -1, 1)
						self.CPoints[i].Border:SetSize(Configuration[Configuration.theme][self.frame].ComboPoints[i].width, Configuration[Configuration.theme][self.frame].ComboPoints[i].height)
						self.CPoints[i].Border:SetTexture(0, 0, 0)

						if i == 1 then
							self.CPoints[i]:SetPoint(Configuration[Configuration.theme][self.frame].ComboPoints.anchor, Configuration[Configuration.theme][self.frame].ComboPoints.x + 2, Configuration[Configuration.theme][self.frame].ComboPoints.y - 2)
							self.CPoints[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].ComboPoints.anchor, 1, -1)
						else
							self.CPoints[i]:SetPoint(Configuration[Configuration.theme][self.frame].ComboPoints.anchor, self.CPoints[i - 1], Configuration[Configuration.theme][self.frame].ComboPoints.anchor2, Configuration[Configuration.theme][self.frame].ComboPoints.xOffset, Configuration[Configuration.theme][self.frame].ComboPoints.yOffset)
							self.CPoints[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].ComboPoints.anchor, self.CPoints[i - 1], Configuration[Configuration.theme][self.frame].ComboPoints.anchor2, Configuration[Configuration.theme][self.frame].ComboPoints.xOffset - 1, Configuration[Configuration.theme][self.frame].ComboPoints.yOffset + 1)
						end
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame].Health) then
				self.Health = CreateFrame('StatusBar', nil, self)
				self.Health.frequentUpdates = true
				self.Health:SetOrientation(Configuration[Configuration.theme][self.frame].Health.orientation)
				self.Health:SetPoint(Configuration[Configuration.theme][self.frame].Health.anchor, Configuration[Configuration.theme][self.frame].Health.x, Configuration[Configuration.theme][self.frame].Health.y)
				self.Health:SetSize(Configuration[Configuration.theme][self.frame].Health.width - 2, Configuration[Configuration.theme][self.frame].Health.height - 2)
				self.Health:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Health.texture)

				if isValid(Configuration[Configuration.theme][self.frame].Health.Color) then
					self.Health:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Health.Color.r, Configuration[Configuration.theme][self.frame].Health.Color.g, Configuration[Configuration.theme][self.frame].Health.Color.b)
				else
					self.Health:SetStatusBarColor(1, 1, 1)
				end
				
				self.Health.Border = self.Health:CreateTexture(nil, 'BACKGROUND')
				self.Health.Border:SetPoint('TOPLEFT', -1, 1)
				self.Health.Border:SetSize(Configuration[Configuration.theme][self.frame].Health.width, Configuration[Configuration.theme][self.frame].Health.height)
				self.Health.Border:SetTexture(0, 0, 0)

				if isValid(Configuration[Configuration.theme][self.frame].Health.Text) then
					self.Health.Text = self.Health:CreateFontString(nil, 'OVERLAY')
					self.Health.Text.frequentUpdates = true
					self.Health.Text:SetFont(Configuration[Configuration.theme][self.frame].Health.Text.font, Configuration[Configuration.theme][self.frame].Health.Text.size, Configuration[Configuration.theme][self.frame].Health.Text.outline)
					self.Health.Text:SetPoint(Configuration[Configuration.theme][self.frame].Health.Text.anchor, Configuration[Configuration.theme][self.frame].Health.Text.x, Configuration[Configuration.theme][self.frame].Health.Text.y)
				end

				if isValid(Configuration[Configuration.theme][self.frame].Health.healPrediction) then
					self.HealPrediction =
					{
						maxOverflow = 1,
						myBar = CreateFrame('StatusBar', nil, self),
						otherBar = CreateFrame('StatusBar', nil, self)
					}

					self.HealPrediction.myBar:SetOrientation(Configuration[Configuration.theme][self.frame].Health.orientation)
					self.HealPrediction.myBar:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
					self.HealPrediction.myBar:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
					self.HealPrediction.myBar:SetSize(Configuration[Configuration.theme][self.frame].Health.width - 2, Configuration[Configuration.theme][self.frame].Health.height - 2)
					self.HealPrediction.myBar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Health.texture)

					self.HealPrediction.otherBar:SetOrientation(Configuration[Configuration.theme][self.frame].Health.orientation)
					self.HealPrediction.otherBar:SetPoint('TOPLEFT', self.HealPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
					self.HealPrediction.otherBar:SetPoint('BOTTOMLEFT', self.HealPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
					self.HealPrediction.otherBar:SetSize(Configuration[Configuration.theme][self.frame].Health.width - 2, Configuration[Configuration.theme][self.frame].Health.height - 2)
					self.HealPrediction.otherBar:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Health.texture)

					if isValid(Configuration[Configuration.theme][self.frame].Health.Color) then
						self.HealPrediction.myBar:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Health.Color.r, Configuration[Configuration.theme][self.frame].Health.Color.g, Configuration[Configuration.theme][self.frame].Health.Color.b)
						self.HealPrediction.otherBar:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Health.Color.r, Configuration[Configuration.theme][self.frame].Health.Color.g, Configuration[Configuration.theme][self.frame].Health.Color.b)
					else
						self.HealPrediction.myBar:SetStatusBarColor(1, 1, 1)
						self.HealPrediction.otherBar:SetStatusBarColor(1, 1, 1)
					end

					if isValid(Configuration[Configuration.theme][self.frame].Health.Text) then
						self:Tag(self.Health.Text, '[SnailUI:HPHealth]')
					end
				else
					if isValid(Configuration[Configuration.theme][self.frame].Health.Text) then
						self:Tag(self.Health.Text, '[SnailUI:Health]')
					end
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame].HolyPower) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'PALADIN' then
					self.HolyPower = CreateFrame('Frame', nil, self)
					self.HolyPower:SetPoint(Configuration[Configuration.theme][self.frame].HolyPower.anchor, Configuration[Configuration.theme][self.frame].HolyPower.x, Configuration[Configuration.theme][self.frame].HolyPower.y)
					self.HolyPower:SetSize(Configuration[Configuration.theme][self.frame].HolyPower.width - 2, Configuration[Configuration.theme][self.frame].HolyPower.height - 2)

					self.HolyPower.Background = self.HolyPower:CreateTexture(nil, 'BACKGROUND')
					self.HolyPower.Background:SetPoint('TOPLEFT')
					self.HolyPower.Background:SetSize(Configuration[Configuration.theme][self.frame].HolyPower.width - 2, Configuration[Configuration.theme][self.frame].HolyPower.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame].HolyPower.Color) then
						self.HolyPower.Background:SetTexture(Configuration[Configuration.theme][self.frame].HolyPower.Color.r, Configuration[Configuration.theme][self.frame].HolyPower.Color.g, Configuration[Configuration.theme][self.frame].HolyPower.Color.b)
					else
						self.HolyPower.Background:SetTexture(1, 1, 1)
					end

					self.HolyPower.Border = self.HolyPower:CreateTexture(nil, 'BACKGROUND')
					self.HolyPower.Border:SetPoint('TOPLEFT', -1, 1)
					self.HolyPower.Border:SetSize(Configuration[Configuration.theme][self.frame].HolyPower.width, Configuration[Configuration.theme][self.frame].HolyPower.height)
					self.HolyPower.Border:SetTexture(0, 0, 0)

					for i = 1, 3 do
						self.HolyPower[i] = CreateFrame('StatusBar', nil, self)
						self.HolyPower[i]:SetSize(Configuration[Configuration.theme][self.frame].HolyPower[i].width - 2, Configuration[Configuration.theme][self.frame].HolyPower[i].height - 2)
						self.HolyPower[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].HolyPower.texture)

						if isValid(Configuration[Configuration.theme][self.frame].HolyPower[i].Color) then
							self.HolyPower[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame].HolyPower[i].Color.r, Configuration[Configuration.theme][self.frame].HolyPower[i].Color.g, Configuration[Configuration.theme][self.frame].HolyPower[i].Color.b)
						else
							self.HolyPower[i]:SetStatusBarColor(1, 1, 1)
						end

						self.HolyPower[i].Border = self.HolyPower:CreateTexture(nil, 'LOW')
						self.HolyPower[i].Border:SetPoint('TOPLEFT', -1, 1)
						self.HolyPower[i].Border:SetSize(Configuration[Configuration.theme][self.frame].HolyPower[i].width, Configuration[Configuration.theme][self.frame].HolyPower[i].height)
						self.HolyPower[i].Border:SetTexture(0, 0, 0)

						if i == 1 then
							self.HolyPower[i]:SetPoint(Configuration[Configuration.theme][self.frame].HolyPower.anchor, Configuration[Configuration.theme][self.frame].HolyPower.x + 2, Configuration[Configuration.theme][self.frame].HolyPower.y - 2)
							self.HolyPower[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].HolyPower.anchor, 1, -1)
						else
							self.HolyPower[i]:SetPoint(Configuration[Configuration.theme][self.frame].HolyPower.anchor, self.HolyPower[i - 1], Configuration[Configuration.theme][self.frame].HolyPower.anchor2, Configuration[Configuration.theme][self.frame].HolyPower.xOffset, Configuration[Configuration.theme][self.frame].HolyPower.yOffset)
							self.HolyPower[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].HolyPower.anchor, self.HolyPower[i - 1], Configuration[Configuration.theme][self.frame].HolyPower.anchor2, Configuration[Configuration.theme][self.frame].HolyPower.xOffset - 1, Configuration[Configuration.theme][self.frame].HolyPower.yOffset + 1)
						end
					end
				end
			end
			
			if isValid(Configuration[Configuration.theme][self.frame].Portrait) then
				self.Portrait = CreateFrame('PlayerModel', nil, self)
				self.Portrait:SetPoint(Configuration[Configuration.theme][self.frame].Portrait.anchor, Configuration[Configuration.theme][self.frame].Portrait.x, Configuration[Configuration.theme][self.frame].Portrait.y)
				self.Portrait:SetSize(Configuration[Configuration.theme][self.frame].Portrait.width - 2, Configuration[Configuration.theme][self.frame].Portrait.height - 2)
				
				self.Portrait.Background = self.Portrait:CreateTexture(nil, 'BACKGROUND')
				self.Portrait.Background:SetPoint('TOPLEFT')
				self.Portrait.Background:SetSize(Configuration[Configuration.theme][self.frame].Portrait.width - 2, Configuration[Configuration.theme][self.frame].Portrait.height - 2)

				if isValid(Configuration[Configuration.theme][self.frame].Portrait.Color) then
					self.Portrait.Background:SetTexture(Configuration[Configuration.theme][self.frame].Portrait.Color.r, Configuration[Configuration.theme][self.frame].Portrait.Color.g, Configuration[Configuration.theme][self.frame].Portrait.Color.b)
				else
					self.Portrait.Background:SetTexture(1, 1, 1)
				end

				self.Portrait.Border = self.Portrait:CreateTexture(nil, 'BACKGROUND')
				self.Portrait.Border:SetPoint('TOPLEFT', -1, 1)
				self.Portrait.Border:SetSize(Configuration[Configuration.theme][self.frame].Portrait.width, Configuration[Configuration.theme][self.frame].Portrait.height)
				self.Portrait.Border:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame].Power) then
				self.Power = CreateFrame('StatusBar', nil, self)
				self.Power.frequentUpdates = true
				self.Power:SetOrientation(Configuration[Configuration.theme][self.frame].Power.orientation)
				self.Power:SetPoint(Configuration[Configuration.theme][self.frame].Power.anchor, Configuration[Configuration.theme][self.frame].Power.x, Configuration[Configuration.theme][self.frame].Power.y)
				self.Power:SetSize(Configuration[Configuration.theme][self.frame].Power.width - 2, Configuration[Configuration.theme][self.frame].Power.height - 2)
				self.Power:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Power.texture)

				if isValid(Configuration[Configuration.theme][self.frame].Power.Color) then
					self.Power:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Power.Color.r, Configuration[Configuration.theme][self.frame].Power.Color.g, Configuration[Configuration.theme][self.frame].Power.Color.b)
				else
					self.Power:SetStatusBarColor(1, 1, 1)
				end
				
				self.Power.Border = self.Power:CreateTexture(nil, 'BACKGROUND')
				self.Power.Border:SetPoint('TOPLEFT', -1, 1)
				self.Power.Border:SetSize(Configuration[Configuration.theme][self.frame].Power.width, Configuration[Configuration.theme][self.frame].Power.height)
				self.Power.Border:SetTexture(0, 0, 0)
			end

			if isValid(Configuration[Configuration.theme][self.frame].Runes) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'DEATHKNIGHT' then
					self.Runes = CreateFrame('Frame', nil, self)
					self.Runes:SetPoint(Configuration[Configuration.theme][self.frame].Runes.anchor, Configuration[Configuration.theme][self.frame].Runes.x, Configuration[Configuration.theme][self.frame].Runes.y)
					self.Runes:SetSize(Configuration[Configuration.theme][self.frame].Runes.width - 2, Configuration[Configuration.theme][self.frame].Runes.height - 2)

					self.Runes.Background = self.Runes:CreateTexture(nil, 'BACKGROUND')
					self.Runes.Background:SetPoint('TOPLEFT')
					self.Runes.Background:SetSize(Configuration[Configuration.theme][self.frame].Runes.width - 2, Configuration[Configuration.theme][self.frame].Runes.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame].Runes.Color) then
						self.Runes.Background:SetTexture(Configuration[Configuration.theme][self.frame].Runes.Color.r, Configuration[Configuration.theme][self.frame].Runes.Color.g, Configuration[Configuration.theme][self.frame].Runes.Color.b)
					else
						self.Runes.Background:SetTexture(1, 1, 1)
					end

					self.Runes.Border = self.Runes:CreateTexture(nil, 'BACKGROUND')
					self.Runes.Border:SetPoint('TOPLEFT', -1, 1)
					self.Runes.Border:SetSize(Configuration[Configuration.theme][self.frame].Runes.width, Configuration[Configuration.theme][self.frame].Runes.height)
					self.Runes.Border:SetTexture(0, 0, 0)

					for i = 1, 6 do
						self.Runes[i] = CreateFrame('StatusBar', nil, self)
						self.Runes[i]:SetSize(Configuration[Configuration.theme][self.frame].Runes[i].width - 2, Configuration[Configuration.theme][self.frame].Runes[i].height - 2)
						self.Runes[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].Runes.texture)

						if isValid(Configuration[Configuration.theme][self.frame].Runes[i].Color) then
							self.Runes[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame].Runes[i].Color.r, Configuration[Configuration.theme][self.frame].Runes[i].Color.g, Configuration[Configuration.theme][self.frame].Runes[i].Color.b)
						else
							self.Runes[i]:SetStatusBarColor(1, 1, 1)
						end

						self.Runes[i].Border = self.Runes:CreateTexture(nil, 'LOW')
						self.Runes[i].Border:SetPoint('TOPLEFT', -1, 1)
						self.Runes[i].Border:SetSize(Configuration[Configuration.theme][self.frame].Runes[i].width, Configuration[Configuration.theme][self.frame].Runes[i].height)
						self.Runes[i].Border:SetTexture(0, 0, 0)

						if i == 1 then
							self.Runes[i]:SetPoint(Configuration[Configuration.theme][self.frame].Runes.anchor, Configuration[Configuration.theme][self.frame].Runes.x + 2, Configuration[Configuration.theme][self.frame].Runes.y - 2)
							self.Runes[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].Runes.anchor, 1, -1)
						else
							self.Runes[i]:SetPoint(Configuration[Configuration.theme][self.frame].Runes.anchor, self.Runes[i - 1], Configuration[Configuration.theme][self.frame].Runes.anchor2, Configuration[Configuration.theme][self.frame].Runes.xOffset, Configuration[Configuration.theme][self.frame].Runes.yOffset)
							self.Runes[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].Runes.anchor, self.Runes[i - 1], Configuration[Configuration.theme][self.frame].Runes.anchor2, Configuration[Configuration.theme][self.frame].Runes.xOffset - 1, Configuration[Configuration.theme][self.frame].Runes.yOffset + 1)
						end
					end

					self.Runes[3], self.Runes[4], self.Runes[5], self.Runes[6] = self.Runes[5], self.Runes[6], self.Runes[3], self.Runes[4]
				end
			end

			if isValid(Configuration[Configuration.theme][self.frame].SoulShards) and (unit == 'Player') then
				if select(2, UnitClass(unit)) == 'WARLOCK' then
					self.SoulShards = CreateFrame('Frame', nil, self)
					self.SoulShards:SetPoint(Configuration[Configuration.theme][self.frame].SoulShards.anchor, Configuration[Configuration.theme][self.frame].SoulShards.x, Configuration[Configuration.theme][self.frame].SoulShards.y)
					self.SoulShards:SetSize(Configuration[Configuration.theme][self.frame].SoulShards.width - 2, Configuration[Configuration.theme][self.frame].SoulShards.height - 2)

					self.SoulShards.Background = self.SoulShards:CreateTexture(nil, 'BACKGROUND')
					self.SoulShards.Background:SetPoint('TOPLEFT')
					self.SoulShards.Background:SetSize(Configuration[Configuration.theme][self.frame].SoulShards.width - 2, Configuration[Configuration.theme][self.frame].SoulShards.height - 2)

					if isValid(Configuration[Configuration.theme][self.frame].SoulShards.Color) then
						self.SoulShards.Background:SetTexture(Configuration[Configuration.theme][self.frame].SoulShards.Color.r, Configuration[Configuration.theme][self.frame].SoulShards.Color.g, Configuration[Configuration.theme][self.frame].SoulShards.Color.b)
					else
						self.SoulShards.Background:SetTexture(1, 1, 1)
					end

					self.SoulShards.Border = self.SoulShards:CreateTexture(nil, 'BACKGROUND')
					self.SoulShards.Border:SetPoint('TOPLEFT', -1, 1)
					self.SoulShards.Border:SetSize(Configuration[Configuration.theme][self.frame].SoulShards.width, Configuration[Configuration.theme][self.frame].SoulShards.height)
					self.SoulShards.Border:SetTexture(0, 0, 0)

					for i = 1, 3 do
						self.SoulShards[i] = CreateFrame('StatusBar', nil, self)
						self.SoulShards[i]:SetSize(Configuration[Configuration.theme][self.frame].SoulShards[i].width - 2, Configuration[Configuration.theme][self.frame].SoulShards[i].height - 2)
						self.SoulShards[i]:SetStatusBarTexture(Configuration[Configuration.theme][self.frame].SoulShards.texture)

						if isValid(Configuration[Configuration.theme][self.frame].SoulShards[i].Color) then
							self.SoulShards[i]:SetStatusBarColor(Configuration[Configuration.theme][self.frame].SoulShards[i].Color.r, Configuration[Configuration.theme][self.frame].SoulShards[i].Color.g, Configuration[Configuration.theme][self.frame].SoulShards[i].Color.b)
						else
							self.SoulShards[i]:SetStatusBarColor(1, 1, 1)
						end

						self.SoulShards[i].Border = self.SoulShards:CreateTexture(nil, 'LOW')
						self.SoulShards[i].Border:SetPoint('TOPLEFT', -1, 1)
						self.SoulShards[i].Border:SetSize(Configuration[Configuration.theme][self.frame].SoulShards[i].width, Configuration[Configuration.theme][self.frame].SoulShards[i].height)
						self.SoulShards[i].Border:SetTexture(0, 0, 0)

						if i == 1 then
							self.SoulShards[i]:SetPoint(Configuration[Configuration.theme][self.frame].SoulShards.anchor, Configuration[Configuration.theme][self.frame].SoulShards.x + 2, Configuration[Configuration.theme][self.frame].SoulShards.y - 2)
							self.SoulShards[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].SoulShards.anchor, 1, -1)
						else
							self.SoulShards[i]:SetPoint(Configuration[Configuration.theme][self.frame].SoulShards.anchor, self.SoulShards[i - 1], Configuration[Configuration.theme][self.frame].SoulShards.anchor2, Configuration[Configuration.theme][self.frame].SoulShards.xOffset, Configuration[Configuration.theme][self.frame].SoulShards.yOffset)
							self.SoulShards[i].Border:SetPoint(Configuration[Configuration.theme][self.frame].SoulShards.anchor, self.SoulShards[i - 1], Configuration[Configuration.theme][self.frame].SoulShards.anchor2, Configuration[Configuration.theme][self.frame].SoulShards.xOffset - 1, Configuration[Configuration.theme][self.frame].SoulShards.yOffset + 1)
						end
					end
				end
			end
		end
	end
)
