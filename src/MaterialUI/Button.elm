module MaterialUI.Button exposing
    ( Button
    , contained
    , outlined
    , text
    )

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import MaterialUI.Icon as Icon exposing (Icon)
import MaterialUI.Theme as Theme


type alias Button a msg =
    { icon : Maybe (Icon msg)
    , color : Theme.Color a
    , text : String
    , onPress : Maybe msg
    }


type alias TextButton a msg =
    { color : Theme.Color a
    , text : String
    , onPress : Maybe msg
    }


text : Theme.Theme a -> TextButton a msg -> Element msg
text theme btn =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 8 0
               , Font.color <| Theme.getColor btn.color theme
               ]
        )
        { label =
            Element.el
                [ Element.centerX
                , Element.centerY
                ]
                (Element.text <|
                    Theme.applyCase theme.typescale.button.fontcase
                        btn.text
                )
        , onPress = btn.onPress
        }


makeLabel : Theme.Theme a -> Theme.Color a -> String -> Maybe (Icon msg) -> Element msg
makeLabel theme color label maybeIcon =
    let
        textEl =
            Element.text <|
                Theme.applyCase theme.typescale.button.fontcase label
    in
    Element.el
        [ Element.centerX
        , Element.centerY
        ]
    <|
        case maybeIcon of
            Nothing ->
                textEl

            Just icon ->
                Element.row
                    [ Element.spacing 8
                    ]
                    [ Icon.view theme color 18 icon
                    , textEl
                    ]


outlined : Theme.Theme a -> Button a msg -> Element msg
outlined theme btn =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ Theme.shapeToAttributes 36 36 theme.shape.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 16 0
               , Border.width 1
               , Border.color <| Theme.getColor btn.color theme
               , Font.color <| Theme.getColor btn.color theme
               ]
        )
        { label = makeLabel theme btn.color btn.text btn.icon
        , onPress = btn.onPress
        }


contained : Theme.Theme a -> Button a msg -> Element msg
contained theme btn =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ Theme.shapeToAttributes 36 36 theme.shape.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 16 0
               , Background.color <| Theme.getColor btn.color theme
               , Font.color <| Theme.getOnColor btn.color theme
               ]
        )
        { label = makeLabel theme (Theme.onColor btn.color) btn.text btn.icon
        , onPress = btn.onPress
        }
