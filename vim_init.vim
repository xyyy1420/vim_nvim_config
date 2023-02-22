set nocompatible

if get(s:,'loaded',0) != 0
    finish
else
    let s:loaded = 1
endif

let s:home = fnamemodify(resolve(expand('<sfile>:p')),':h')

command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

exec 'set rtp+='.s:home

set rtp+=~/.vim



LoadScript init/init-plugins.vim
LoadScript init/init-basic.vim
"LoadScript init/init-config.vim
"LoadScript init/init-style.vim
LoadScript init/init-keymaps.vim
"LoadScript ./vim_test_plugin.vim


echo " 凡我不能创造的，我就不能理解。 ——理查德·费曼 "


