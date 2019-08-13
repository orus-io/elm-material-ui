module MaterialUI.Icons.Toggle exposing
    ( check_box
    , check_box_outline_blank
    , indeterminate_check_box
    , radio_button_checked
    , radio_button_unchecked
    , star
    , star_border
    , star_half
    )

{-|


# Icons

@docs check_box
@docs check_box_outline_blank
@docs indeterminate_check_box
@docs radio_button_checked
@docs radio_button_unchecked
@docs star
@docs star_border
@docs star_half

-}

import Material.Icons.Toggle as Toggle
import MaterialUI.Icon exposing (Icon, makeIcon)


check_box : Icon msg
check_box =
    makeIcon Toggle.check_box


check_box_outline_blank : Icon msg
check_box_outline_blank =
    makeIcon Toggle.check_box_outline_blank


indeterminate_check_box : Icon msg
indeterminate_check_box =
    makeIcon Toggle.indeterminate_check_box


radio_button_checked : Icon msg
radio_button_checked =
    makeIcon Toggle.radio_button_checked


radio_button_unchecked : Icon msg
radio_button_unchecked =
    makeIcon Toggle.radio_button_unchecked


star : Icon msg
star =
    makeIcon Toggle.star


star_border : Icon msg
star_border =
    makeIcon Toggle.star_border


star_half : Icon msg
star_half =
    makeIcon Toggle.star_half
