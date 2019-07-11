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
import MaterialUI.Internal as Internal
import MaterialUI.Theme as Theme


type alias Button a msg =
    { icon : Maybe (Icon msg)
    , color : Theme.Color a
    , text : String
    , onPress : Maybe msg
    , disabled : Bool
    }


text : Button a msg -> Theme.Theme a -> Element msg
text btn theme =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 8 0
               , Element.focused
                    [ Border.glow theme.color.surface 0 ]
               ]
            ++ (if btn.disabled then
                    [ Font.color <| Theme.setAlpha 0.5 theme.color.onSurface
                    , Internal.disabled True
                    ]

                else
                    [ Font.color <| Theme.getColor btn.color theme
                    , Element.mouseDown
                        [ Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.2) ]
                    , Element.focused
                        [ Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.15)
                        ]
                    , Element.mouseOver
                        [ Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.1) ]
                    ]
               )
        )
        { label =
            makeLabel theme
                (if btn.disabled then
                    Theme.Custom <| Theme.setAlpha 0.5 theme.color.onSurface

                 else
                    btn.color
                )
                btn.text
                btn.icon
        , onPress =
            if btn.disabled then
                Nothing

            else
                btn.onPress
        }


outlined : Button a msg -> Theme.Theme a -> Element msg
outlined btn theme =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ Theme.shapeToAttributes 36 36 theme.shape.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 16 0
               , Border.width 1
               , Element.focused
                    [ Border.glow theme.color.surface 0 ]
               ]
            ++ (if btn.disabled then
                    [ Border.color <| Theme.setAlpha 0.5 theme.color.onSurface
                    , Font.color <| Theme.setAlpha 0.5 theme.color.onSurface
                    , Internal.disabled True
                    ]

                else
                    [ Border.color <| Theme.getColor btn.color theme
                    , Font.color <| Theme.getColor btn.color theme
                    , Element.mouseDown
                        [ Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.2) ]
                    , Element.focused
                        [ Border.glow theme.color.surface 0
                        , Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.15)
                        ]
                    , Element.mouseOver
                        [ Background.color (Theme.getColor btn.color theme |> Theme.setAlpha 0.1) ]
                    ]
               )
        )
        { label =
            makeLabel theme
                (if btn.disabled then
                    Theme.Custom <| Theme.setAlpha 0.5 theme.color.onSurface

                 else
                    btn.color
                )
                btn.text
                btn.icon
        , onPress =
            if btn.disabled then
                Nothing

            else
                btn.onPress
        }


contained : Button a msg -> Theme.Theme a -> Element msg
contained btn theme =
    Input.button
        (Theme.fontToAttributes theme.typescale.button
            ++ Theme.shapeToAttributes 36 36 theme.shape.button
            ++ [ Element.height <| Element.px 36
               , Element.width (Element.shrink |> Element.minimum 64)
               , Element.paddingXY 16 0
               , Element.focused
                    [ Border.glow theme.color.surface 0
                    ]
               ]
            ++ (if btn.disabled then
                    [ Font.color <| Theme.setAlpha 0.5 theme.color.onSurface
                    , Background.color <| Theme.setAlpha 0.2 theme.color.onSurface
                    ]

                else
                    [ Font.color <| Theme.getOnColor btn.color theme
                    , Background.color <| Theme.getColor btn.color theme
                    , Element.mouseDown
                        [ Background.color (Theme.getColor btn.color theme |> Theme.addLightness 0.15) ]
                    , Element.focused
                        [ Background.color (Theme.getColor btn.color theme |> Theme.addLightness 0.1)
                        ]
                    , Element.mouseOver
                        [ Background.color (Theme.getColor btn.color theme |> Theme.addLightness 0.05) ]
                    ]
               )
        )
        { label =
            makeLabel theme
                (if btn.disabled then
                    Theme.Custom <| Theme.setAlpha 0.5 theme.color.onSurface

                 else
                    Theme.onColor btn.color
                )
                btn.text
                btn.icon
        , onPress =
            if btn.disabled then
                Nothing

            else
                btn.onPress
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
