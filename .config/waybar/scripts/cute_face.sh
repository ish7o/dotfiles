#!/bin/bash

# Define an array of cute faces
cute_faces=(
    "(｡♥‿♥｡)"
    "(≧◡≦)"
    "(๑˃̵ᴗ˂̵)و"
    "(◕‿◕✿)"
    "(｡•̀ᴗ-)✧"
    "(｡≧▽≦)"
    "(≧ω≦)"
    "(◕ω◕)"
    "(⁄ ⁄•⁄ω⁄•⁄ ⁄)"
    "(✿\´‿\`)"
    "(๑•̀ㅂ•́)و"
    "(⊃｡•́‿•̀｡)⊃"
    "(✧ω✧)"
    "(๑•̀ㅂ•́)و✧"
    "(╯✧▽✧)╯"
    "(⊙_☉)"
    "(✧Д✧)"
    "(°ロ°) !"
    "(￣口￣)"
    "(o_O)"
    "(¬‿¬)"
    "(✿◕ ‿◕✿)"
    "(╯°□°）╯︵ ┻━┻"
    "(✪ω✪)"
    "(•̀ᴗ•́)و"
)

num_faces=${#cute_faces[@]}
random_index=$(( RANDOM % num_faces ))
random_face=${cute_faces[$random_index]}

echo $random_face


