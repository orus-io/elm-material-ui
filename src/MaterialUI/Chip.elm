module MaterialUI.Chip exposing (Chip, chip)

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import MaterialUI.Theme as Theme exposing (Theme)
import MaterialUI.Thumbnail exposing (Thumbnail)


type alias Chip a msg =
    { thumbnail : Maybe (Thumbnail msg)
    , closable : Bool
    , color : Theme.Color a
    , text : String
    , onPress : Maybe msg
    }


chip : Theme a -> Chip a msg -> Element msg
chip theme c =
    Element.text c.text
