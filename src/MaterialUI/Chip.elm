module MaterialUI.Chip exposing (Chip, chip)

import Element as Element exposing (Element)
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
chip theme chip_ =
    Input.button
        (Theme.fontToAttributes theme.typescale.body2
            ++ Theme.shapeToAttributes 32 32 theme.shape.chip
            ++ [ Element.height <| Element.px 32
               , Element.width (Element.shrink |> Element.minimum 32)
               , Element.paddingXY 8 0
               , Font.color <| Theme.getOnColor Theme.Surface theme
               , Background.color
                    (Theme.getOnColor Theme.Surface theme
                        |> Element.toRgb
                        |> (\c -> { c | alpha = 0.12 })
                        |> Element.fromRgb
                    )
               ]
        )
        { label =
            Element.el
                [ Element.centerX
                , Element.centerY
                ]
                (Element.text <|
                    Theme.applyCase theme.typescale.body2.fontcase
                        chip_.text
                )
        , onPress = chip_.onPress
        }
