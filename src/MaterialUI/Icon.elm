module MaterialUI.Icon exposing (Icon, makeIcon, view)

import Color exposing (Color)
import Element exposing (Element)
import MaterialUI.Icons.Internal as Internal
import MaterialUI.Theme as Theme exposing (Theme)
import Svg exposing (Svg)


type Icon msg
    = Icon (Internal.Icon msg)


makeIcon : Internal.Icon msg -> Icon msg
makeIcon =
    Icon


view : Theme a -> Theme.Color a -> Int -> Icon msg -> Element msg
view theme colorkey size (Icon icon) =
    let
        color =
            Theme.getColor colorkey theme
                |> Element.toRgb
                |> Color.fromRgba
    in
    Element.el
        [ Element.width <| Element.px size
        , Element.height <| Element.px size
        ]
        (Element.html
            (Svg.svg []
                [ icon color size ]
            )
        )
