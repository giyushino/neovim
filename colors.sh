#!/bin/bash

#!/bin/bash

COLOR=$1

echo setting color to $COLOR
BASE="/home/allanz/.config"


if [ $COLOR == "blue" ]; then
    cp $BASE/nvim/blue/init.lua $BASE/nvim/init.lua
    cp $BASE/nvim/blue/theme.lua $BASE/nvim/lua/plugins/theme.lua
    cp $BASE/nvim/blue/lualine.lua $BASE/nvim/lua/plugins/lualine.lua

else
    cp $BASE/nvim/black/init.lua $BASE/nvim/init.lua
    cp $BASE/nvim/black/theme.lua $BASE/nvim/lua/plugins/theme.lua
    cp $BASE/nvim/black/lualine.lua $BASE/nvim/lua/plugins/lualine.lua

fi


exec >/dev/null 2>&1
