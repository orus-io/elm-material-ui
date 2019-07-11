module MaterialUI.RadioTest exposing (book)

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
import Element.Input as Input
import MaterialUI.Icon exposing (Icon)
import MaterialUI.Icons.Action as Action
import MaterialUI.Radio as Radio
import MaterialUI.TestUtils exposing (booleanStory, colorStory, onPressStory, render, themeStory)
import MaterialUI.Theme as Theme exposing (Theme)


viewRadio :
    Theme a
    -> Theme.Color a
    -> String
    -> Bool
    -> List (Radio.Option String)
    -> Element String
viewRadio theme color label hideLabel options =
    Radio.radio []
        { onChange = identity
        , color = color
        , options = options
        , selected = Just "A"
        , label = label
        , hideLabel = hideLabel
        }
        |> render theme


labelStory : Story String
labelStory =
    Story "Label" []
        |> Story.addOption "Longer_Text" "Longer Text"
        |> Story.addOption "Text" "Text"


iconStory : Story (Maybe (Icon String))
iconStory =
    Story "Icon" []
        |> Story.addOption "Alarm" (Just Action.alarm)
        |> Story.addOption "Nothing" Nothing


optionsStory : Story (List (Radio.Option String))
optionsStory =
    Story "Options"
        [ ( "2"
          , [ Radio.option "A" "Option A"
            , Radio.option "B" "Option B"
            ]
          )
        , ( "1"
          , [ Radio.option "A" "Option A"
            ]
          )
        , ( "0", [] )
        , ( "Many"
          , [ Radio.option "A" "Option A"
            , Radio.option "B" "Option B"
            , Radio.option "C" "Option C"
            , Radio.option "D" "Option D"
            , Radio.option "E" "Option E"
            , Radio.option "F" "Option F"
            , Radio.option "G" "Option G"
            , Radio.option "H" "Option H"
            , Radio.option "I" "Option I"
            ]
          )
        ]


book : List ( String, Theme a ) -> Book
book themes =
    Bibliopola.intoBook "Radio" identity viewRadio
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> addStory (booleanStory "HideLabel" False)
        |> addStory optionsStory
        |> buildBook
