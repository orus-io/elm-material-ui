module MaterialUI.TextField exposing (TextField, Type(..), text)

import Element exposing (Element)
import Element.Input as Input
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
    }


text : TextField a msg -> Theme a -> Element msg
text field theme =
    let
        label =
            if field.hideLabel then
                Input.labelHidden field.label

            else
                Input.labelAbove [] (Element.text field.label)
    in
    Input.text []
        { onChange = field.onChange
        , label = label
        , placeholder = Nothing
        , text = field.text
        }
