module MaterialUI.Internal exposing (htmlClass)

import Element exposing (Attribute, htmlAttribute)
import Html.Attributes


htmlClass : String -> Attribute msg
htmlClass name =
    Html.Attributes.class name
        |> htmlAttribute
