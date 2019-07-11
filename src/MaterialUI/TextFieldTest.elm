module MaterialUI.TextFieldTest exposing (shelf)

import Bibliopola
    exposing
        ( Book
        , Shelf
        , Story
        , addBook
        , addStory
        , buildBook
        , emptyShelf
        , intoBook
        )
import Bibliopola.Story as Story
import Element exposing (Element)
import MaterialUI.Icon exposing (Icon)
import MaterialUI.Icons.Action as Action
import MaterialUI.TestUtils
    exposing
        ( booleanStory
        , colorStory
        , labelStory
        , onPressStory
        , render
        , themeStory
        )
import MaterialUI.TextField as TextField
import MaterialUI.Theme as Theme exposing (Theme)


viewTextField :
    Theme a
    -> Theme.Color a
    -> TextField.Type
    -> String
    -> Bool
    -> String
    -> TextField.State
    -> Maybe String
    -> Maybe String
    -> Element String
viewTextField theme color type_ label hideLabel text state helperText errorText =
    TextField.text [ Element.width <| Element.px 400 ]
        { color = color
        , label = label
        , hideLabel = hideLabel
        , type_ = type_
        , text = text
        , onChange = identity
        , state = state
        , helperText = helperText
        , errorText = errorText
        }
        |> render theme


iconStory : Story (Maybe (Icon String))
iconStory =
    Story "Icon" []
        |> Story.addOption "Alarm" (Just Action.alarm)
        |> Story.addOption "Nothing" Nothing


typeStory : Story TextField.Type
typeStory =
    Story "Type"
        [ ( "Filled", TextField.Filled )
        , ( "Outlined", TextField.Outlined )
        ]


textStory : Story String
textStory =
    Story "Text"
        [ ( "Some_text", "Some text" )
        , ( "Longer_text", "A longer text thay may be bigger than the field" )
        , ( "Empty", "" )
        ]


helperTextStory : Story (Maybe String)
helperTextStory =
    Story "HelperText"
        [ ( "Nothing", Nothing )
        , ( "Some_text", Just "Some helper text" )
        ]


errorTextStory : Story (Maybe String)
errorTextStory =
    Story "ErrorText"
        [ ( "Nothing", Nothing )
        , ( "Some_Error", Just "Bad value, try again" )
        ]


stateStory : Story TextField.State
stateStory =
    Story "State"
        [ ( "Idle", TextField.Idle )
        , ( "Focused", TextField.Focused )
        , ( "Disabled", TextField.Disabled )
        ]


textFieldBook : List ( String, Theme a ) -> Book
textFieldBook themes =
    Bibliopola.intoBook "Text" identity viewTextField
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory typeStory
        |> addStory labelStory
        |> addStory (booleanStory "HideLabel" False)
        |> addStory textStory
        |> addStory stateStory
        |> addStory helperTextStory
        |> addStory errorTextStory
        |> buildBook


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    emptyShelf "TextField"
        |> addBook (textFieldBook themes)
