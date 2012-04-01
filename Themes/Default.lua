-- Default.lua
-- Written by Snail

Configuration['Default'] =
{
	Bag =
	{
		anchor = 'RIGHT',
		colorByClass = true,
		height = 200,
		width = 200,
		x = -100,
		y = 0,
	},

	Focus =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 32,
		width = 126,
		x = -365,
		y = -102,

		Cast =
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

		Health =
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
			anchor = 'TOPRIGHT',
			height = 28,
			width = 28,
			x = -3,
			y = -3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		Power =
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

		Battleground =
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

		LFG =
		{
			anchor ='BOTTOMLEFT',
			x = 0,
			y = 0
		},

		Mail =
		{
			anchor ='BOTTOMRIGHT',
			x = 1,
			y = -2
		},

		Tracking =
		{
			anchor ='TOPLEFT',
			x = -1,
			y = 0
		}
	},

	Pet =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 16,
		x = -440,
		y = -50,

		Cast =
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

		Health =
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
			anchor = 'BOTTOMLEFT',
			height = 12,
			width = 12,
			x = 3,
			y = 3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		Power =
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

	Player =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 256,
		x = -300,
		y = -50,

		Cast =
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

		ComboPoints =
		{
			anchor = 'TOPLEFT',
			anchor2 = 'TOPRIGHT',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 1,
			xOffset = 3,
			y = 19,
			yOffset = 0,

			[1] =
			{
				height = 12,
				width = 50
			},

			[2] =
			{
				height = 12,
				width = 49
			},

			[3] =
			{
				height = 12,
				width = 50
			},

			[4] =
			{
				height = 12,
				width = 49
			},

			[5] =
			{
				height = 12,
				width = 50
			}
		},

		Health =
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
			anchor = 'TOPLEFT',
			height = 60,
			width = 60,
			x = 3,
			y = -3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		HolyPower =
		{
			anchor = 'TOPLEFT',
			anchor2 = 'TOPRIGHT',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 1,
			xOffset = 3,
			y = 19,
			yOffset = 0,

			[1] =
			{
				height = 12,
				width = 83
			},

			[2] =
			{
				height = 12,
				width = 84
			},

			[3] =
			{
				height = 12,
				width = 83
			}
		},

		Power =
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

		Runes =
		{
			anchor = 'TOPLEFT',
			anchor2 = 'TOPRIGHT',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 1,
			xOffset = 3,
			y = 19,
			yOffset = 0,

			[1] =
			{
				height = 12,
				width = 42
			},

			[2] =
			{
				height = 12,
				width = 41
			},

			[3] =
			{
				height = 12,
				width = 41
			},

			[4] =
			{
				height = 12,
				width = 41
			},

			[5] =
			{
				height = 12,
				width = 41
			},

			[6] =
			{
				height = 12,
				width = 41
			}
		},

		SoulShards =
		{
			anchor = 'TOPLEFT',
			anchor2 = 'TOPRIGHT',
			colorByClass = true,
			height = 16,
			orientation = 'HORIZONTAL',
			texture = [[Interface\AddOns\SnailUI\SnailUI]],
			width = 256,
			x = 1,
			xOffset = 3,
			y = 19,
			yOffset = 0,

			[1] =
			{
				height = 12,
				width = 83
			},

			[2] =
			{
				height = 12,
				width = 84
			},

			[3] =
			{
				height = 12,
				width = 83
			}
		}
	},

	Raid =
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

		Health =
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
		},
	},

	Target =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 256,
		x = 300,
		y = -50,

		Cast =
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

		Health =
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
			anchor = 'TOPRIGHT',
			height = 60,
			width = 60,
			x = -3,
			y = -3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		Power =
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

	Targettarget =
	{
		anchor = 'CENTER',
		colorByClass = true,
		height = 64,
		width = 16,
		x = 440,
		y = -50,

		Cast =
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

		Health =
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
			anchor = 'BOTTOMLEFT',
			height = 12,
			width = 12,
			x = 3,
			y = 3,

			Color =
			{
				b = 0,
				g = 0,
				r = 0
			}
		},

		Power =
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
