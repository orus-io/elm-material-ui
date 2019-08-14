module MaterialUI.Card exposing (Card, card)

import Element exposing (Attribute, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import MaterialUI.Theme as Theme exposing (Theme)
import MaterialUI.Thumbnail as Thumbnail exposing (Thumbnail)


type alias Card msg =
    { elevated : Bool
    , body : Element msg
    }


card : List (Attribute msg) -> Card msg -> Theme a -> Element.Element msg
card attrs c theme =
    Element.el
        ([ Background.color theme.color.surface
         , Font.color theme.color.onSurface
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
            ++ attrs
        )
        c.body
