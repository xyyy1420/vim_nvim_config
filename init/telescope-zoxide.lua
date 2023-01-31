local z_utils=require("telescope._extensions.zoxide.utils")
require("telescope").setup{
    extensions={
        zoxide={
            prompt_title="[ Walking on the shoulders of TJ ]",
            mappings={
                default={
                    after_action=function (selection)
                        print("Updata to (" .. selection.z_score .. ") " .. selection.path)
                    end
                },
                ["<C-r>"]={
                    action = function (selection)
                        vim.cmd("tabe " .. selection.path)
                    end
                }
--                ["<C-s>"]={
--                    before_action = function (selection) print("before C-s") end,
--                    action = function (selection)
--                        vim.cmd("edit " .. selection.path)
--                    end
--                        
--                },
--                ["<C-q>"] = {action = z_utils.create_basic_command("split") },
            },
        }
    }
}
