module MaterialUI.Internal exposing (disabled, htmlClass)

import Element exposing (Attribute, htmlAttribute)
import Html.Attributes


htmlClass : String -> Attribute msg
htmlClass name =
    Html.Attributes.class name
        |> htmlAttribute


disabled : Bool -> Attribute msg
disabled =
    Html.Attributes.disabled
        >> htmlAttribute
