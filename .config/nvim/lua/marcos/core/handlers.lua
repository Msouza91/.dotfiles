local M = {}
function M.azure()
	local opts = {
		settings = {
			yaml = {
				cmd = { "~/Downloads/package/bin/azure-pipelines-language-server" },
				capabilities = capabilities,
				schemas = {
					["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
						"/azure-pipeline*.y*l",
						"/*.azure*",
						"Azure-Pipelines/**/*.y*l",
						"Pipelines/*.y*l",
						"projects/**/*.y*l",
						"projects/*.y*l",
					},
				},
			},
		},
	}
	return opts
end
return M
