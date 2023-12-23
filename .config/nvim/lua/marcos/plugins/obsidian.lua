return {
    'epwalsh/obsidian.nvim',
    version = "*",  -- recommended, use latest release instead of latest commit
    event = { "BufReadPre *.md", "BufNewFile *.md" },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup({

            dir = "~/vaults/Deez-notes", -- Path to your Obsidian vault. Default: "~/vault"

            templates = {
                subdir = "Templates",
                date_format = "%d-%m-%y-%a",
                time_format = "%H:%M",
            },

            -- see below for full list of options 👇
            finder = "telescope.nvim",
            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "Daily-notes",
                -- Optional, if you want to change the date format for the ID of daily notes.
                date_format = "%d-%m-%y",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%d-%m,-%y",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = "daily.md",
            },
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,

                -- Trigger completion at 2 chars.
                min_chars = 2,
            },
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
            },
            -- Optional, configure additional syntax highlighting / extmarks.
            ui = {
                enable = true,  -- set to false to disable all additional syntax features
                update_debounce = 200,  -- update delay after a text change (in milliseconds)
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            },
        })
    end
}
