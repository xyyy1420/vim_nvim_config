require('toggleterm').setup{
    -- 开启终端按键映射
    open_mapping=[[<C-\>]],
    -- 不自动跟随文件切换主目录
    autochdir=false,
    -- 浮动样式
    direction='tab',
    -- shell fish
    shell="zsh",
    -- 自动滚动到终端底部
    auto_scroll=true,
    -- 打开映射适用与插入模式
    insert_mappings=true,
    terminal_mappings=true,
    shade_terminals=true,
    winbar={
        enable=true,
        name_formatter=function (term)
            return term.name
        end
    },

}
