require('lualine').setup{
	option = {
		icons_enabled = true,
		theme = 'wombat',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	}
}
