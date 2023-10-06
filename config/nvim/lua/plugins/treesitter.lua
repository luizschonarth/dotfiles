return {
    "nvim-treesitter/nvim-treesitter",
    init = function ()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
                -- Disables syntax highlighting for big files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            ensure_installed = {
                "c", "cpp", "rust", "python", "javascript", "typescript",
                "lua", "bash", "tsx", "html", "markdown", "markdown_inline",
                "regex", "json", "yaml", "toml", "bibtex", "latex", "yuck",
                "vim",
            },
        })
    end
}

