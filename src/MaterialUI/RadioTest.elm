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
import MaterialUI.TestUtils exposing (colorStory, onPressStory, render, themeStory)
import MaterialUI.Theme as Theme exposing (Theme)


viewRadio :
    Theme a
    -> Theme.Color a
    -> String
    -> Element String
viewRadio theme color text =
    Radio.radio []
        { onChange = identity
        , color = color
        , options =
            [ Radio.option "A" "A"
            , Radio.option "B" "B"
            ]
        , selected = Just "A"
        , label = "Label"
        , hideLabel = False
        }
        |> render theme


labelStory : Story String
labelStory =
    Story "Label" []
        |> Story.addOption "Longer Text" "Longer Text"
        |> Story.addOption "Text" "Text"


iconStory : Story (Maybe (Icon String))
iconStory =
    Story "Icon" []
        |> Story.addOption "Alarm" (Just Action.alarm)
        |> Story.addOption "Nothing" Nothing


book : List ( String, Theme a ) -> Book
book themes =
    Bibliopola.intoBook "Radio" identity viewRadio
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> buildBook
