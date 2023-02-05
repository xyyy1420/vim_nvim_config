vim.g.coq_settings={
    auto_start="shut-up",
    display={
        icons = {
            -- mode = "none",
            mode = "none",
            mappings = {
                Class = "⬢",
                Color = "❁",
                Constant = "π",
                Constructor = "⬡",
                Event = "⤸",
                Field = "◧",
                File = "∎",
                Folder = "⋃",
                Function = "λ",
                Interface = "⊷",
                Keyword = "𝑘",
                Module = "■",
                Operator = "÷",
                Property = "⋯",
                Reference = "→",
                Snippet = "◸",
                Struct = "▣",
                Text = "ᴀ",
                TypeParameter = "ᴛ",
                Unit = "␣",
                Value = "⧉",
                Variable = "𝑣",
            },
        },
    }
}
require("coq")
