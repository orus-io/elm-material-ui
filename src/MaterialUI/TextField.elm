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
    , errorText : Maybe String
    , helperText : Maybe String
    }


text : List (Attribute msg) -> TextField a msg -> Theme a -> Element msg
text attrs field theme =
    let
        hasError =
            field.errorText /= Nothing

        labelInFront =
            -- is the label in front of the input ?
            not field.focused && field.text == ""

        labelText =
            if hasError then
                field.label ++ "*"

            else
                field.label

        labelPosition =
            Element.alignBottom
                :: (case ( field.type_, labelInFront ) of
                        ( Outlined, True ) ->
                            [ Element.moveRight 10
                            , Element.moveUp 20
                            ]

                        ( Outlined, False ) ->
                            [ Element.moveRight 10
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
            case ( hasError, field.focused ) of
                ( True, _ ) ->
                    [ Font.color theme.color.error
                    ]

                ( False, True ) ->
                    [ Font.color (Theme.getColor field.color theme)
                    ]

                ( False, False ) ->
                    [ Font.color (theme.color.onSurface |> Theme.addAlpha 0.6)
                    ]

        labelFont =
            if labelInFront then
                Theme.fontToAttributes theme.typescale.subtitle1

            else
                Theme.fontToAttributes theme.typescale.caption

        label =
            if field.hideLabel && not labelInFront then
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
                    (Element.text labelText)

        borderColor =
            case ( hasError, field.focused ) of
                ( True, _ ) ->
                    [ Border.color theme.color.error
                    ]

                ( False, True ) ->
                    [ Border.color <| Theme.getColor field.color theme
                    ]

                ( False, False ) ->
                    [ Border.color <| Theme.addAlpha 0.3 theme.color.onSurface
                    , Element.mouseOver
                        [ Border.color <| Theme.addAlpha 0.6 theme.color.onSurface
                        ]
                    ]

        borders =
            case field.type_ of
                Outlined ->
                    Theme.shapeToAttributes 56 56 theme.shape.textField.outlined
                        ++ [ if field.focused then
                                Border.width 2

                             else
                                Border.width 1
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                ]
                           ]
                        ++ borderColor

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
                           , Border.color <| Theme.addAlpha 0.4 theme.color.onSurface
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                , Border.color <| Theme.getColor field.color theme
                                ]
                           , if field.focused then
                                Border.color <| Theme.getColor field.color theme

                             else
                                Element.mouseOver
                                    [ Border.color <| Theme.addAlpha 0.8 theme.color.onSurface
                                    ]
                           ]
                        ++ borderColor

        padding =
            case field.type_ of
                Filled ->
                    [ Element.paddingEach
                        { top =
                            if field.hideLabel then
                                0

                            else
                                20
                        , bottom =
                            if field.focused then
                                0

                            else
                                1
                        , left = 12
                        , right = 12
                        }
                    ]

                Outlined ->
                    [ Element.paddingEach
                        { top =
                            if field.focused then
                                0

                            else
                                1
                        , bottom =
                            if field.focused then
                                0

                            else
                                1
                        , left =
                            if field.focused then
                                13

                            else
                                14
                        , right =
                            if field.focused then
                                13

                            else
                                14
                        }
                    ]

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

        belowElementAttributes =
            Theme.fontToAttributes theme.typescale.caption
                ++ [ Element.height <| Element.px 16
                   , Element.paddingXY 12 0
                   ]
    in
    Element.column [] <|
        [ Input.text
            (Theme.fontToAttributes theme.typescale.subtitle1
                ++ [ Element.height <| Element.px 56
                   , Element.inFront label
                   , Element.htmlAttribute
                        (style
                            "transition"
                            "border 0.15s, background 0.15s, padding 0.15s"
                        )
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
            ++ (case ( field.errorText, field.helperText ) of
                    ( Just error, _ ) ->
                        [ Element.el
                            (Font.color theme.color.error :: belowElementAttributes)
                            (Element.el [ Element.alignBottom ] <| Element.text error)
                        ]

                    ( Nothing, Just helperText ) ->
                        [ Element.el
                            (Font.color (Theme.addAlpha 0.7 theme.color.onSurface) :: belowElementAttributes)
                            (Element.el [ Element.alignBottom ] <| Element.text helperText)
                        ]

                    _ ->
                        []
               )
