require('toggleterm').setup{
    -- 开启终端按键映射
    open_mapping=[[<C-\>]],
    -- 不自动跟随文件切换主目录
    autochdir=false,
    -- 浮动样式
    direction='float',
    -- shell fish
    shell="fish",
    -- 自动滚动到终端底部
    auto_scroll=true,
    -- 打开映射适用与插入模式
    insert_mappings=true,
    shade_terminals=true,

}
