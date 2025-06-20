#!/bin/bash

# This script is used to change the top and bottom padding of the outer container in the Aerospace theme.

presentation_pixel_gaps=300
top_normal_pixel_gaps=82
bottom_normal_pixel_gaps=40
terminal_font_size=18
terminal_presentation_font_size=22

if [ $1 == "on" ]; then
    sed -i '' "s/\(outer\.top = *\[.*\), $top_normal_pixel_gaps]/\1, $presentation_pixel_gaps]/" ~/.config/aerospace/aerospace.toml
    sed -i '' "s/\(outer\.bottom = *\[.*\), $bottom_normal_pixel_gaps]/\1, $presentation_pixel_gaps]/" ~/.config/aerospace/aerospace.toml
    sed -i '' "s/size.*/size=$terminal_presentation_font_size/" ~/.config/alacritty/alacritty.toml
    if [ "$(dark-notify -e)" = "dark" ]; then
        osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/marcos/Downloads/nafdnzphc38ee5yibrsx.png"'
    else
        osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/marcos/Downloads/qtxk7cprgi4ck1p2wilj.png"'
    fi
    aerospace reload-config
elif [ $1 == "off" ]; then
    sed -i '' "s/\(outer\.top = *\[.*\), $presentation_pixel_gaps]/\1, $top_normal_pixel_gaps]/" ~/.config/aerospace/aerospace.toml
    sed -i '' "s/\(outer\.bottom = *\[.*\), $presentation_pixel_gaps]/\1, $bottom_normal_pixel_gaps]/" ~/.config/aerospace/aerospace.toml
    sed -i '' "s/size.*/size=$terminal_font_size/" ~/.config/alacritty/alacritty.toml
    if [ "$(dark-notify -e)" = "dark" ]; then
        osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/marcos/Downloads/Wall/IMG_6926.jpg"'
    else
        osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/marcos/Downloads/Wall/IMG_6925.jpg"'
    fi
    aerospace reload-config
fi
