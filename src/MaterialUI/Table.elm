module MaterialUI.Table exposing (Config, table)

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import MaterialUI.Icon as Icon exposing (Icon)
import MaterialUI.Internal as Internal
import MaterialUI.Theme as Theme


type alias Column data msg =
    { header : Element msg
    , width : Element.Length
    , view : data -> Element msg
    }


type alias Config data msg =
    { columns : List (Column data msg)
    }


table :
    Config data msg
    -> List data
    -> Theme.Theme a
    -> Element msg
table cfg data theme =
    let
        sepColor =
            Theme.setAlpha 0.2 theme.color.onSurface
    in
    Element.table
        [ Background.color theme.color.surface
        , Font.color theme.color.onSurface
        , Border.width 1
        , Border.rounded 4
        , Border.color sepColor
        ]
        { data = data
        , columns =
            cfg.columns
                |> List.map
                    (\col ->
                        { header =
                            Element.el
                                [ Element.height (Element.shrink |> Element.minimum 56)
                                , Element.padding 16
                                ]
                                col.header
                        , width = col.width
                        , view =
                            Element.el
                                [ Element.height (Element.shrink |> Element.minimum 52)
                                , Element.padding 16
                                , Border.widthEach { top = 1, bottom = 0, left = 0, right = 0 }
                                , Border.color sepColor
                                ]
                                << col.view
                        }
                    )
        }
