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
import MaterialUI.TestUtils exposing (booleanStory, colorStory, onPressStory, render, themeStory)
import MaterialUI.TextField as TextField
import MaterialUI.Theme as Theme exposing (Theme)


viewTextField :
    Theme a
    -> Theme.Color a
    -> TextField.Type
    -> String
    -> Bool
    -> String
    -> Element String
viewTextField theme color type_ label hideLabel text =
    TextField.text
        { color = color
        , label = label
        , hideLabel = hideLabel
        , type_ = type_
        , text = text
        , onChange = identity
        }
        |> render theme


labelStory : Story String
labelStory =
    Story "Label"
        [ ( "Text", "Text" )
        , ( "Longer Text", "Longer Text" )
        ]


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
        [ ( "Some text", "Some text" )
        , ( "Longer text", "A longer text thay may be bigger than the field" )
        , ( "Empty", "" )
        ]


textFieldBook : List ( String, Theme a ) -> Book
textFieldBook themes =
    Bibliopola.intoBook "Text" identity viewTextField
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory typeStory
        |> addStory labelStory
        |> addStory (booleanStory "HideLabel")
        |> addStory textStory
        |> buildBook


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    emptyShelf "TextField"
        |> addBook (textFieldBook themes)
