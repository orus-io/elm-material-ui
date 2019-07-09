module MaterialUI.ButtonTest exposing (shelf)

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
import MaterialUI.Button as Button
import MaterialUI.Icon exposing (Icon)
import MaterialUI.Icons.Action as Action
import MaterialUI.TestUtils
    exposing
        ( colorStory
        , iconStory
        , labelStory
        , onPressStory
        , themeStory
        , wrapView
        )
import MaterialUI.Theme as Theme exposing (Theme)


viewTextButton :
    Theme a
    -> Theme.Color a
    -> String
    -> Maybe String
    -> Element String
viewTextButton theme color text onPress =
    Button.text theme
        { color = color
        , text = text
        , onPress = onPress
        }
        |> wrapView theme


viewOutlinedButton :
    Theme a
    -> Theme.Color a
    -> String
    -> Maybe (Icon String)
    -> Maybe String
    -> Element String
viewOutlinedButton theme color text icon onPress =
    Button.outlined theme
        { color = color
        , text = text
        , icon = icon
        , onPress = onPress
        }
        |> wrapView theme


viewContainedButton :
    Theme a
    -> Theme.Color a
    -> String
    -> Maybe (Icon String)
    -> Maybe String
    -> Element String
viewContainedButton theme color text icon onPress =
    Button.contained theme
        { color = color
        , text = text
        , icon = icon
        , onPress = onPress
        }
        |> wrapView theme


textButtonBook : List ( String, Theme a ) -> Book
textButtonBook themes =
    Bibliopola.intoBook "Text" identity viewTextButton
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> addStory (onPressStory "button")
        |> buildBook


outlinedButtonBook : List ( String, Theme a ) -> Book
outlinedButtonBook themes =
    Bibliopola.intoBook "Outlined" identity viewOutlinedButton
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> addStory iconStory
        |> addStory (onPressStory "button")
        |> buildBook


containedButtonBook : List ( String, Theme a ) -> Book
containedButtonBook themes =
    Bibliopola.intoBook "Contained" identity viewContainedButton
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory labelStory
        |> addStory iconStory
        |> addStory (onPressStory "button")
        |> buildBook


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    emptyShelf "Button"
        |> addBook (textButtonBook themes)
        |> addBook (outlinedButtonBook themes)
        |> addBook (containedButtonBook themes)
