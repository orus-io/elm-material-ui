module MaterialUI.Icons.Internal exposing (Icon)

import Color exposing (Color)
import Element exposing (Element)
import MaterialUI.Theme as Theme exposing (Theme)
import Svg exposing (Svg)


type alias Icon msg =
    Color -> Int -> Svg msg
