module MaterialUI.CardTest exposing (book)

import Bibliopola
    exposing
        ( Book
        , Shelf
        , Story
        , addStory
        , buildBook
        , intoBook
        )
import Bibliopola.Story as Story
import Element exposing (Element)
import MaterialUI.Card as Card exposing (Card)
import MaterialUI.TestUtils exposing (ThemeList, themeStory, wrapView)
import MaterialUI.Theme as Theme exposing (Theme)


viewCard : Theme a -> List (Card.Element String) -> Bool -> Element String
viewCard theme elements elevated =
    Card.card { elevated = elevated, elements = elements } theme
        |> wrapView theme


cardElementsStory : Story (List (Card.Element String))
cardElementsStory =
    Story "Elements" []
        |> Story.addOption "Empty"
            [ Card.Header
                { text = "Title does here"
                , thumbnail = Nothing
                }
            ]


book : ThemeList a -> Book
book themes =
    intoBook "Card" identity viewCard
        |> addStory (themeStory themes)
        |> addStory cardElementsStory
        |> addStory
            (Story "Elevated" []
                |> Story.addOption "True" True
                |> Story.addOption "False" False
            )
        |> buildBook
