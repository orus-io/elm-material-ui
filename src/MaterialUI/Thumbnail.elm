module MaterialUI.Thumbnail exposing (Thumbnail, thumbnail)

import Element exposing (Element)
import MaterialUI.Icon as Icon exposing (Icon)
import MaterialUI.Theme as Theme exposing (Theme)


type Thumbnail msg
    = Icon (Icon msg)


thumbnail : Thumbnail msg -> Theme.Color a -> Int -> Theme a -> Element msg
thumbnail tn color size theme =
    case tn of
        Icon icon ->
            Icon.view theme color size icon
