module MaterialUI.Card exposing (Card, CardHeader, Element(..), card)

import Element
import Element.Background as Background
import Element.Border as Border
import MaterialUI.Theme as Theme exposing (Theme)
import MaterialUI.Thumbnail as Thumbnail exposing (Thumbnail)


type alias CardHeader msg =
    { text : String
    , thumbnail : Maybe (Thumbnail msg)
    }


type Element msg
    = Header (CardHeader msg)
    | Media


type alias Card msg =
    { elevated : Bool
    , elements : List (Element msg)
    }


card : Card msg -> Theme a -> Element.Element msg
card c theme =
    Element.column
        ([ Background.color theme.color.surface
         , Element.shrink |> Element.minimum 32 |> Element.width
         , Element.shrink |> Element.minimum 32 |> Element.height
         ]
            ++ Theme.shapeToAttributes 36 36 theme.shape.button
            ++ (if c.elevated then
                    [ Border.shadow
                        { offset = ( 1, 1 )
                        , size = 1
                        , blur = 1
                        , color = Theme.setAlpha 0.16 theme.color.onSurface
                        }
                    ]

                else
                    [ Border.color <| Theme.setAlpha 0.16 theme.color.onSurface
                    , Border.width 1
                    ]
               )
        )
        []
