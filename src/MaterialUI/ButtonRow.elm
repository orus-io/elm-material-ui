module MaterialUI.ButtonRow exposing (row, stacked)

import Element exposing (Attribute, Element)
import MaterialUI.Theme as Theme exposing (Theme)


row : List (Attribute msg) -> List (Theme.Theme a -> Element msg) -> Theme.Theme a -> Element msg
row attrs buttons theme =
    List.map (\btn -> Element.el [ Element.alignRight ] <| btn theme) buttons
        |> List.reverse
        |> Element.row
            (attrs
                ++ [ Element.padding 8
                   , Element.spacing 8
                   ]
            )


stacked : List (Attribute msg) -> List (Theme.Theme a -> Element msg) -> Theme.Theme a -> Element msg
stacked attrs buttons theme =
    List.map (\btn -> Element.el [ Element.alignRight ] <| btn theme) buttons
        |> Element.column
            (attrs
                ++ [ Element.padding 8
                   , Element.spacing 12
                   ]
            )
