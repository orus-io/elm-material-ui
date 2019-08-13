module MaterialUI.TextField exposing (State(..), TextField, Type(..), text)

import Element exposing (Attribute, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html.Attributes exposing (style)
import MaterialUI.Internal as Internal
import MaterialUI.Theme as Theme exposing (Theme)


type Type
    = Filled
    | Outlined


type State
    = Idle
    | Focused
    | Disabled


type alias TextField a msg =
    { label : String
    , hideLabel : Bool
    , type_ : Type
    , color : Theme.Color a
    , text : String
    , onChange : String -> msg
    , state : State
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
            not field.hideLabel && field.state /= Focused && field.text == ""

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
            case ( hasError, field.state ) of
                ( True, _ ) ->
                    [ Font.color theme.color.error
                    ]

                ( False, Focused ) ->
                    [ Font.color (Theme.getColor field.color theme)
                    ]

                ( False, _ ) ->
                    [ Font.color (theme.color.onSurface |> Theme.setAlpha 0.6)
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
            case ( hasError, field.state ) of
                ( True, _ ) ->
                    [ Border.color theme.color.error
                    ]

                ( False, Focused ) ->
                    [ Border.color <| Theme.getColor field.color theme
                    ]

                ( False, Idle ) ->
                    [ Border.color <| Theme.setAlpha 0.3 theme.color.onSurface
                    , Element.mouseOver
                        [ Border.color <| Theme.setAlpha 0.6 theme.color.onSurface
                        ]
                    ]

                ( False, Disabled ) ->
                    [ Border.color <| Theme.setAlpha 0.3 theme.color.onSurface
                    ]

        borders =
            case field.type_ of
                Outlined ->
                    Theme.shapeToAttributes 56 56 theme.shape.textField.outlined
                        ++ [ Border.width 1
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                ]
                           , Element.behindContent <|
                                Element.el
                                    (Theme.shapeToAttributes 56 56 theme.shape.textField.outlined
                                        ++ [ Border.width
                                                (if field.state == Focused then
                                                    2

                                                 else
                                                    1
                                                )
                                           , Element.width Element.fill
                                           , Element.height Element.fill
                                           , Element.htmlAttribute
                                                (style "transition" "border 0.15s")
                                           , Background.color <| Theme.setAlpha 0.0 theme.color.onSurface
                                           ]
                                        ++ borderColor
                                    )
                                    Element.none
                           ]
                        ++ borderColor

                Filled ->
                    Theme.shapeToAttributes 56 56 theme.shape.textField.filled
                        ++ [ Border.widthEach
                                { bottom =
                                    if field.state == Focused then
                                        2

                                    else
                                        1
                                , top = 0
                                , left = 0
                                , right = 0
                                }
                           , Border.color <| Theme.setAlpha 0.4 theme.color.onSurface
                           , Element.focused
                                [ Border.glow theme.color.onSurface 0
                                , Border.color <| Theme.getColor field.color theme
                                ]
                           , case field.state of
                                Idle ->
                                    Element.mouseOver
                                        [ Border.color <| Theme.setAlpha 0.8 theme.color.onSurface
                                        ]

                                Focused ->
                                    Border.color <| Theme.getColor field.color theme

                                Disabled ->
                                    Element.mouseOver
                                        []
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
                            if field.state == Focused then
                                0

                            else
                                1
                        , left = 12
                        , right = 12
                        }
                    ]

                Outlined ->
                    [ Element.paddingXY 13 0
                    ]

        background =
            case field.type_ of
                Outlined ->
                    [ --Background.color theme.color.surface
                      Background.color <| Theme.setAlpha 0.0 theme.color.onSurface
                    ]

                Filled ->
                    [ Background.color <| Theme.setAlpha 0.05 theme.color.onSurface
                    ]
                        ++ (case field.state of
                                Focused ->
                                    [ Background.color <| Theme.setAlpha 0.15 theme.color.onSurface ]

                                Idle ->
                                    [ Element.mouseOver
                                        [ Background.color <| Theme.setAlpha 0.1 theme.color.onSurface
                                        ]
                                    , Element.focused
                                        [ Border.glow theme.color.onSurface 0
                                        , Background.color <| Theme.setAlpha 0.15 theme.color.onSurface
                                        ]
                                    ]

                                Disabled ->
                                    []
                           )

        belowElementAttributes =
            Theme.fontToAttributes theme.typescale.caption
                ++ [ Element.height <| Element.px 16
                   , Element.paddingXY 12 0
                   ]
    in
    Element.column [] <|
        [ Input.text
            (Theme.fontToAttributes theme.typescale.subtitle1
                ++ borders
                ++ [ Element.height <| Element.px 56
                   , Element.inFront label
                   , Element.htmlAttribute
                        (style
                            "transition"
                            "border 0.15s, background 0.15s, padding 0.15s"
                        )
                   , Element.htmlAttribute (Html.Attributes.style "flex" "1")
                   , Font.color
                        (if field.state == Disabled then
                            Theme.setAlpha 0.7 theme.color.onSurface

                         else
                            theme.color.onSurface
                        )
                   , Internal.disabled <| field.state == Disabled
                   ]
                ++ padding
                ++ attrs
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
                            (Font.color (Theme.setAlpha 0.6 theme.color.onSurface) :: belowElementAttributes)
                            (Element.el [ Element.alignBottom ] <| Element.text helperText)
                        ]

                    _ ->
                        []
               )
