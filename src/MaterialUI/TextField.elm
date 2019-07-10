module MaterialUI.TextField exposing (TextField, Type(..), text)

import Element exposing (Attribute, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html.Attributes exposing (style)
import MaterialUI.Theme as Theme exposing (Theme)


type Type
    = Filled
    | Outlined


type alias TextField a msg =
    { label : String
    , hideLabel : Bool
    , type_ : Type
    , color : Theme.Color a
    , text : String
    , onChange : String -> msg
    , focused : Bool
    }


text : List (Attribute msg) -> TextField a msg -> Theme a -> Element msg
text attrs field theme =
    let
        labelInFront =
            -- is the label in front of the input ?
            not field.hideLabel && not field.focused && field.text == ""

        labelPosition =
            Element.alignBottom
                :: (case ( field.type_, labelInFront ) of
                        ( Outlined, True ) ->
                            [ Element.moveRight 8
                            , Element.moveUp 20
                            ]

                        ( Outlined, False ) ->
                            [ Element.moveRight 8
                            , Background.color theme.color.surface
                            , Element.moveUp 48
                            ]

                        ( Filled, True ) ->
                            [ Element.moveRight 8
                            , Element.moveUp <| 28 - toFloat theme.typescale.subtitle1.size / 2
                            ]

                        ( Filled, False ) ->
                            [ Element.moveRight 8
                            , Element.moveUp 36
                            ]
                   )

        labelColor =
            if field.focused then
                [ Font.color (Theme.getColor field.color theme)
                ]

            else
                [ Font.color (theme.color.onSurface |> Theme.addAlpha 0.6)
                ]

        labelFont =
            if labelInFront then
                Theme.fontToAttributes theme.typescale.subtitle1

            else
                Theme.fontToAttributes theme.typescale.caption

        label =
            if field.hideLabel then
                Element.none

            else
                Element.el
                    (labelPosition
                        ++ labelColor
                        ++ labelFont
                        ++ [ Element.htmlAttribute (style "transition" "all 0.15s")
                           , Element.width Element.shrink
                           , Element.paddingXY 4 0
                           ]
                    )
                    (Element.text field.label)

        borders =
            case field.type_ of
                Outlined ->
                    Theme.shapeToAttributes 56 56 theme.shape.textField.outlined
                        ++ [ if field.focused then
                                Border.width 2

                             else
                                Border.width 1
                           , Border.color <| Theme.addAlpha 0.3 theme.color.onSurface
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                , Border.color <| Theme.getColor field.color theme
                                ]
                           , Element.mouseOver
                                [ Border.color <| Theme.addAlpha 0.6 theme.color.onSurface
                                ]
                           ]

                Filled ->
                    Theme.shapeToAttributes 56 56 theme.shape.textField.filled
                        ++ [ Border.widthEach
                                { bottom =
                                    if field.focused then
                                        2

                                    else
                                        1
                                , top = 0
                                , left = 0
                                , right = 0
                                }
                           , Border.color <| Theme.addAlpha 0.3 theme.color.onSurface
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                , Border.color <| Theme.getColor field.color theme
                                ]
                           , if field.focused then
                                Border.color <| Theme.getColor field.color theme

                             else
                                Element.mouseOver
                                    [ Border.color <| Theme.addAlpha 0.6 theme.color.onSurface
                                    ]
                           ]

        padding =
            case field.type_ of
                Filled ->
                    [ Element.paddingEach { top = 20, bottom = 0, left = 12, right = 12 } ]

                _ ->
                    []

        background =
            case field.type_ of
                Outlined ->
                    [ Background.color theme.color.surface
                    ]

                Filled ->
                    [ Background.color <| Theme.addAlpha 0.05 theme.color.onSurface
                    , if field.focused then
                        Background.color <| Theme.addAlpha 0.15 theme.color.onSurface

                      else
                        Element.mouseOver
                            [ Background.color <| Theme.addAlpha 0.1 theme.color.onSurface
                            ]
                    , Element.focused
                        [ Border.glow theme.color.onSurface 0
                        , Background.color <| Theme.addAlpha 0.15 theme.color.onSurface
                        ]
                    ]
    in
    Element.column []
        [ Input.text
            (Theme.fontToAttributes theme.typescale.subtitle1
                ++ [ Element.height <| Element.px 56
                   , Element.inFront label
                   , Element.htmlAttribute (style "transition" "border 0.15s, background 0.15s")
                   ]
                ++ padding
                ++ attrs
                ++ borders
                ++ background
            )
            { onChange = field.onChange
            , label = Input.labelHidden field.label
            , placeholder = Nothing
            , text = field.text
            }
        ]
