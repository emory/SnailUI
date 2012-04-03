-- Default.lua
-- Written by Snail

Configuration['Default'] =
{
	ActionBar =
	{
		
	},

	FocusFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 32,
		width = 126,
		x = -365,
		y = -102,

		CastingBar =
		{
			anchor = 'LEFT',
			colorByClass = true,
			height = 32,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 8,
			x = -9,
			y = 0
		},

		HealthBar =
		{
			anchor = 'TOPLEFT',
			colorByClass = true,
			height = 23,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 93,
			x = 3,
			y = -3
		},

		Portrait =
		{
			anchor = 'RIGHT',
			height = 28,
			width = 28,
			x = -3,
			y = 0,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		PowerBar =
		{
			anchor = 'BOTTOMLEFT',
			colorByClass = true,
			height = 4,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 93,
			x = 3,
			y = 3
		}
	},

	Minimap =
	{
		anchor = 'TOPRIGHT',
		colorByClass = true,
		height = 192,
		texture = [[Interface\Buttons\WHITE8X8]],
		width = 192,
		x = -7,
		y = -7,

		BattlegroundButton =
		{
			anchor ='BOTTOMLEFT',
			x = 2,
			y = 0
		},

		Clock =
		{
			anchor ='BOTTOM',
			font = [[Interface\AddOns\SnailUI\SnailUI.ttf]],
			outline = 'MONOCHROME, OUTLINE',
			size = 8,
			x = 2,
			y = 6
		},

		LFGButton =
		{
			anchor ='BOTTOMLEFT',
			x = 0,
			y = 0
		},

		MailButton =
		{
			anchor ='BOTTOMRIGHT',
			x = 1,
			y = -2
		},

		TrackingButton =
		{
			anchor ='TOPLEFT',
			x = -1,
			y = 0
		}
	},

	PetFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 16,
		x = -440,
		y = -50,

		CastingBar =
		{
			anchor = 'LEFT',
			colorByClass = true,
			height = 64,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 8,
			x = -9,
			y = 0
		},

		HealthBar =
		{
			anchor = 'TOPRIGHT',
			colorByClass = true,
			height = 47,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 7,
			x = -3,
			y = -3
		},

		Portrait =
		{
			anchor = 'BOTTOM',
			height = 12,
			width = 12,
			x = 0,
			y = 3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		PowerBar =
		{
			anchor = 'TOPLEFT',
			colorByClass = true,
			height = 47,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 4,
			x = 3,
			y = -3
		}
	},

	PlayerFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 256,
		x = -300,
		y = -50,

		CastingBar =
		{
			anchor = 'BOTTOM',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 0,
			y = -17
		},

		ComboPointBar =
		{
			anchor = 'TOP',
			colorByClass = true,
			height = 16,
			width = 256,
			x = 0,
			y = 19,

			[1] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 50,
				x = 2,
				y = 0
			},

			[2] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 49,
				x = 53,
				y = 0
			},

			[3] =
			{
				anchor = 'CENTER',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 50,
				x = 0,
				y = 0
			},

			[4] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 49,
				x = -53,
				y = 0
			},

			[5] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 50,
				x = -2,
				y = 0
			}
		},

		HealthBar =
		{
			anchor = 'TOPRIGHT',
			colorByClass = true,
			height = 53,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 191,
			x = -3,
			y = -3
		},

		Portrait =
		{
			anchor = 'LEFT',
			height = 60,
			width = 60,
			x = 3,
			y = 0,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		HolyPowerBar =
		{
			anchor = 'TOP',
			colorByClass = true,
			height = 16,
			width = 256,
			x = 0,
			y = 19,

			[1] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 83,
				x = 2,
				y = 0
			},

			[2] =
			{
				anchor = 'CENTER',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 84,
				x = 0,
				y = 0
			},

			[3] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 83,
				x = -2,
				y = 0
			}
		},

		PowerBar =
		{
			anchor = 'BOTTOMRIGHT',
			colorByClass = true,
			height = 6,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 191,
			x = -3,
			y = 3
		},

		RuneBar =
		{
			anchor = 'TOP',
			colorByClass = true,
			height = 16,
			width = 256,
			x = 0,
			y = 19,

			[1] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 42,
				x = 2,
				y = 0
			},

			[2] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 41,
				x = 45,
				y = 0
			},

			[3] =
			{
				anchor = 'CENTER',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 41,
				x = -20,
				y = 0
			},

			[4] =
			{
				anchor = 'CENTER',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 41,
				x = 22,
				y = 0
			},

			[5] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 41,
				x = -44,
				y = 0
			},

			[6] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 41,
				x = -2,
				y = 0
			}
		},

		SoulShardBar =
		{
			anchor = 'TOP',
			colorByClass = true,
			height = 16,
			width = 256,
			x = 0,
			y = 19,

			[1] =
			{
				anchor = 'LEFT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 83,
				x = 2,
				y = 0
			},

			[2] =
			{
				anchor = 'CENTER',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 84,
				x = 0,
				y = 0
			},

			[3] =
			{
				anchor = 'RIGHT',
				height = 12,
				orientation = 'HORIZONTAL',
				texture = [[Interface\AddOns\SnailUI\SnailUI]],
				width = 83,
				x = -2,
				y = 0
			}
		}
	},

	RaidFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		columnAnchor = 'LEFT',
		columns = 8,
		columnSpacing = 4,
		columnX = 0,
		columnY = -4,
		groupBy = 'GROUP',
		groupOrder = '1, 2, 3, 4, 5, 6, 7, 8',
		healthThreshold = 90,
		height = 24,
		rows = 5,
		showParty = true,
		showPlayer = true,
		showRaid = true,
		showSolo = true,
		width = 96,
		x = 0,
		y = -300,

		HealthBar =
		{
			anchor = 'TOPLEFT',
			colorByClass = true,
			healPrediction = true,
			height = 20,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 92,
			x = 3,
			y = -3,

			Text =
			{
				anchor ='CENTER',
				font = [[Interface\AddOns\SnailUI\SnailUI.ttf]],
				outline = 'MONOCHROME, OUTLINE',
				size = 8,
				x = 1,
				y = 0
			}
		}
	},

	TargetFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 256,
		x = 300,
		y = -50,

		CastingBar =
		{
			anchor = 'BOTTOM',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 0,
			y = -17
		},

		HealthBar =
		{
			anchor = 'TOPLEFT',
			colorByClass = true,
			height = 53,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 191,
			x = 3,
			y = -3
		},

		Portrait =
		{
			anchor = 'RIGHT',
			height = 60,
			width = 60,
			x = -3,
			y = 0,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		PowerBar =
		{
			anchor = 'BOTTOMLEFT',
			colorByClass = true,
			height = 6,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 191,
			x = 3,
			y = 3
		}
	},

	TargetTargetFrame =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 16,
		x = 440,
		y = -50,

		CastingBar =
		{
			anchor = 'RIGHT',
			colorByClass = true,
			height = 64,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 8,
			x = 9,
			y = 0
		},

		HealthBar =
		{
			anchor = 'TOPRIGHT',
			colorByClass = true,
			height = 47,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 7,
			x = -3,
			y = -3
		},

		Portrait =
		{
			anchor = 'BOTTOM',
			height = 12,
			width = 12,
			x = 0,
			y = 3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		PowerBar =
		{
			anchor = 'TOPLEFT',
			colorByClass = true,
			height = 47,
			orientation = 'VERTICAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 4,
			x = 3,
			y = -3
		}
	}
}
