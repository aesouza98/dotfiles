return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	-- tag = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neorg/neorg-telescope",
	},
	run = ":Neorg sync-parsers",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.integrations.telescope"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Documentos/notes",
							aiq = "~/Aiqfome/notes",
							devocional = "~/Documentos/devocional",
						},
					},
				},
			},
		})
	end,
}
