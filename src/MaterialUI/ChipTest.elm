module MaterialUI.ChipTest exposing (shelf)

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
import MaterialUI.Chip as Chip
import MaterialUI.TestUtils
    exposing
        ( booleanStory
        , colorStory
        , labelStory
        , onPressStory
        , themeStory
        , thumbnailStory
        , wrapView
        )
import MaterialUI.Theme as Theme exposing (Theme)
import MaterialUI.Thumbnail as Thumbnail exposing (Thumbnail)


viewChip :
    Theme a
    -> Theme.Color a
    -> String
    -> Maybe (Thumbnail String)
    -> Bool
    -> Maybe String
    -> Element String
viewChip theme color text thumbnail closable onPress =
    Chip.chip theme
        { thumbnail = thumbnail
        , closable = closable
        , color = color
        , text = text
        , onPress = onPress
        }
        |> wrapView theme


chipBook : List ( String, Theme a ) -> Book
chipBook themes =
    Bibliopola.intoBook "Chip" identity viewChip
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> addStory thumbnailStory
        |> addStory (booleanStory "Closable")
        |> addStory (onPressStory "chip")
        |> buildBook


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    emptyShelf "Chip"
        |> addBook (chipBook themes)
