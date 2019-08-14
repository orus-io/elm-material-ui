module MaterialUI.Tabs exposing
    ( IconPosition(..)
    , Tabs
    , label
    , tabs
    )

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Element.Region as Region
import MaterialUI.Icon as Icon exposing (Icon)
import MaterialUI.Internal as Internal
import MaterialUI.Theme as Theme


type IconPosition
    = TopIcon
    | LeadingIcon
    | OnlyIcon


type alias Label key msg =
    { key : key
    , text : String
    , icon : Maybe (Icon msg)
    }


label : option -> String -> Maybe (Icon msg) -> Label option msg
label =
    Label


type alias Tabs color key msg =
    { tabs : List (Label key msg)
    , selected : Maybe key
    , color : Theme.Color color
    , fixed : Bool
    , onPress : Maybe (key -> msg)
    , disabled : Bool
    , iconPos : IconPosition
    }


tabs : List (Element.Attribute msg) -> Tabs color key msg -> Theme.Theme color -> Element msg
tabs attrs tabsdef theme =
    Element.row
        (attrs
            ++ [ Element.height <|
                    if tabsdef.iconPos == TopIcon then
                        Element.px 72

                    else
                        Element.px 48
               ]
            ++ (if not tabsdef.fixed then
                    [ Element.clip ]

                else
                    []
               )
        )
    <|
        List.map (\tabdef -> tab tabsdef tabdef theme) tabsdef.tabs


tab : Tabs color key msg -> Label key msg -> Theme.Theme color -> Element msg
tab tabsdef tabLabel theme =
    let
        color =
            Theme.getColor tabsdef.color theme

        disabledColor =
            Theme.setAlpha 0.5 theme.color.onSurface

        selectedColor =
            Theme.getColor tabsdef.color theme

        selected =
            tabsdef.selected == Just tabLabel.key

        mouseDownBgColor =
            Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.2

        focusedBgColor =
            Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.15

        mouseOverBgColor =
            Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.1

        width =
            (if tabsdef.fixed then
                Element.fill

             else
                Element.shrink
            )
                |> Element.minimum 90
                |> Element.maximum 360
    in
    -- add a container element so the focused styles don't leak to the sibblings
    Element.el
        [ if tabsdef.fixed then
            Element.width Element.fill

          else
            Element.width Element.shrink
        ]
    <|
        Input.button
            (Theme.fontToAttributes theme.typescale.button
                ++ [ Element.width width
                   , Element.height <|
                        Element.px
                            (if tabsdef.iconPos == TopIcon then
                                72

                             else
                                48
                            )
                   , Element.paddingXY 16 0
                   , Border.widthEach { bottom = 2, top = 0, left = 0, right = 0 }
                   , Element.focused
                        [ Border.glow theme.color.surface 0 ]
                   ]
                ++ (if tabsdef.disabled then
                        [ Font.color disabledColor
                        , Internal.disabled True
                        ]
                            ++ (if selected then
                                    [ Border.color disabledColor
                                    ]

                                else
                                    [ Border.color Theme.transparent
                                    ]
                               )

                    else
                        [ Element.mouseDown
                            [ Background.color (Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.2) ]
                        , Element.focused
                            [ Border.glow theme.color.surface 0
                            , Background.color (Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.15)
                            ]
                        , Element.mouseOver
                            [ Background.color (Theme.getColor tabsdef.color theme |> Theme.setAlpha 0.1) ]
                        ]
                            ++ (if selected then
                                    [ Border.color color
                                    , Font.color color
                                    ]

                                else
                                    [ Font.color disabledColor
                                    , Border.color Theme.transparent
                                    ]
                               )
                   )
            )
            { label =
                makeLabel theme
                    (if tabsdef.disabled || not selected then
                        Theme.Custom disabledColor

                     else
                        tabsdef.color
                    )
                    tabsdef.iconPos
                    tabLabel
            , onPress =
                if tabsdef.disabled then
                    Nothing

                else
                    Maybe.map ((|>) tabLabel.key) tabsdef.onPress
            }


makeLabel : Theme.Theme a -> Theme.Color a -> IconPosition -> Label key msg -> Element msg
makeLabel theme color iconPos tabLabel =
    let
        textEl text =
            Element.text <|
                Theme.applyCase theme.typescale.button.fontcase text
    in
    Element.el
        [ Element.centerX
        , Element.centerY
        , Region.description tabLabel.text
        ]
    <|
        case ( iconPos, tabLabel.icon ) of
            ( TopIcon, Nothing ) ->
                Element.column
                    [ Element.paddingXY 0 12
                    , Element.spacing 8
                    ]
                    [ Element.el [ Element.height <| Element.px 24 ] Element.none
                    , textEl tabLabel.text
                    ]

            ( _, Nothing ) ->
                textEl tabLabel.text

            ( OnlyIcon, Just icon ) ->
                Icon.view theme color 24 icon

            ( LeadingIcon, Just icon ) ->
                Element.row
                    [ Element.spacing 8
                    ]
                    [ Icon.view theme color 24 icon
                    , textEl tabLabel.text
                    ]

            ( TopIcon, Just icon ) ->
                Element.column
                    [ Element.paddingXY 0 12
                    , Element.spacing 8
                    ]
                    [ Element.el [ Element.centerX ] <| Icon.view theme color 24 icon
                    , textEl tabLabel.text
                    ]
