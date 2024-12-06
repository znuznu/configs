local is_npm_package_installed = require("znu.utils").is_npm_package_installed

local have_tailwindish_styling = is_npm_package_installed("windicss")

if have_tailwindish_styling then
	require("lspconfig").tailwindcss.setup({
		on_attach = require("znu.plugins.lsp").on_attach,
		capabilities = require("znu.plugins.lsp").capabilities,
		settings = {
			tailwindCSS = {
				classAttributes = {
					"class",
					"className",
					"classList",
					"enterActiveClass",
					"exitActiveClass",
					"enterClass",
					"exitToClass",
				},
			},
		},
	})
end
