#!/bin/bash
echo "Press[Y|n] to confirm each"
echo "ctags >"
read r
if [[ $r == "y" || $r == "Y" ]]; then
    echo "ctag..."
    cp ./config/ctags $HOME/.ctags
fi

