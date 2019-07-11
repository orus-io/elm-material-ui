module MaterialUI.ElmFormInput exposing (radioInput, textInput)

import Element exposing (Attribute, Element)
import Element.Events as Events
import Form exposing (FieldState)
import Form.Error exposing (ErrorValue)
import Form.Field
import MaterialUI.Radio as Radio
import MaterialUI.TextField as TextField
import MaterialUI.Theme as Theme exposing (Theme)


textInput :
    (ErrorValue a -> String)
    -> FieldState a String
    -> List (Attribute Form.Msg)
    ->
        { label : String
        , hideLabel : Bool
        , type_ : TextField.Type
        , color : Theme.Color b
        , helperText : Maybe String
        , disabled : Bool
        }
    -> Theme b
    -> Element Form.Msg
textInput renderError state attrs props =
    TextField.text
        ([ Events.onFocus <| Form.Focus state.path
         , Events.onLoseFocus <| Form.Blur state.path
         ]
            ++ attrs
        )
        { label = props.label
        , hideLabel = props.hideLabel
        , type_ = props.type_
        , color = props.color
        , text = state.value |> Maybe.withDefault ""
        , onChange = Form.Field.String >> Form.Input state.path Form.Text
        , state =
            if props.disabled then
                TextField.Disabled

            else if state.hasFocus then
                TextField.Focused

            else
                TextField.Idle
        , errorText =
            Maybe.map renderError state.error
        , helperText = props.helperText
        }


radioInput :
    (ErrorValue a -> String)
    -> FieldState a String
    -> List (Attribute Form.Msg)
    ->
        { color : Theme.Color b
        , options : List (Radio.Option String)
        , label : String
        , hideLabel : Bool
        }
    -> Theme b
    -> Element Form.Msg
radioInput renderError state attrs props =
    Radio.radio
        ([ Events.onFocus <| Form.Focus state.path
         , Events.onLoseFocus <| Form.Blur state.path
         ]
            ++ attrs
        )
        { color = props.color
        , options = props.options
        , selected = state.value
        , label = props.label
        , hideLabel = props.hideLabel
        , onChange = Form.Field.String >> Form.Input state.path Form.Text
        }
