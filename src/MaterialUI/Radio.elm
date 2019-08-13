module MaterialUI.Radio exposing (Option, option, radio)

import Element exposing (Attribute, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input exposing (Option)
import MaterialUI.Internal as Internal
import MaterialUI.Theme as Theme exposing (Theme)


radioOption : String -> Theme.Color a -> Theme a -> Input.OptionState -> Element msg
radioOption label color theme status =
    Element.row
        [ Element.spacing 10
        , Element.alignLeft
        , Element.width Element.shrink
        ]
        [ Element.el
            ([ Element.width <| Element.px 24
             , Element.height <| Element.px 24
             , Border.rounded 12
             , Border.width 3
             , Border.color <|
                case status of
                    Input.Idle ->
                        theme.color.onSurface |> Theme.setAlpha 0.5

                    Input.Focused ->
                        Theme.getColor color theme

                    Input.Selected ->
                        Theme.getColor color theme
             ]
                ++ (case status of
                        Input.Focused ->
                            [ Element.focused
                                [ Border.glow (Theme.getColor color theme) 10
                                , Border.innerShadow
                                    { offset = ( 0, 0 )
                                    , size = 10
                                    , blur = 10
                                    , color =
                                        Theme.getColor color theme
                                    }
                                ]
                            ]

                        Input.Selected ->
                            [ Internal.htmlClass "focusable"
                            , Element.focused
                                [ Border.glow (Theme.getColor color theme) 10
                                , Border.innerShadow
                                    { offset = ( 0, 0 )
                                    , size = 10
                                    , blur = 10
                                    , color =
                                        Theme.getColor color theme
                                    }
                                ]
                            ]

                        Input.Idle ->
                            []
                   )
            )
          <|
            Element.el
                [ Element.width <| Element.px 12
                , Element.height <| Element.px 12
                , Element.centerX
                , Element.centerY
                , Border.rounded 9
                , Internal.htmlClass "unfocusable"
                , Background.color <|
                    case status of
                        Input.Idle ->
                            theme.color.surface

                        Input.Focused ->
                            theme.color.surface

                        Input.Selected ->
                            Theme.getColor color theme
                ]
                Element.none
        , Element.text label
        ]


type Option option
    = Option option String


option : option -> String -> Option option
option =
    Option


radio :
    List (Attribute msg)
    ->
        { onChange : option -> msg
        , color : Theme.Color a
        , options : List (Option option)
        , selected : Maybe option
        , label : String
        , hideLabel : Bool
        }
    -> Theme a
    -> Element msg
radio attrs props theme =
    Element.column
        [ Element.spacing 4
        , Element.paddingXY 0 4
        ]
        [ if not props.hideLabel then
            Element.el
                (Theme.fontToAttributes theme.typescale.caption)
                (Element.text props.label)

          else
            Element.none
        , Input.radio ([ Element.spacing 8 ] ++ attrs)
            { onChange = props.onChange
            , options =
                props.options
                    |> List.map
                        (\(Option optionValue optionLabel) ->
                            Input.optionWith optionValue <| radioOption optionLabel props.color theme
                        )
            , selected = props.selected
            , label =
                Input.labelHidden props.label
            }
        ]
