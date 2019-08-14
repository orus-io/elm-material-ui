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


viewCard : Theme a -> Element String -> Bool -> Element String
viewCard theme body elevated =
    Card.card [] { elevated = elevated, body = body } theme
        |> wrapView theme


cardBodyStory : Story (Element String)
cardBodyStory =
    Story "Body"
        [ ( "Empty", Element.none )
        , ( "Text", Element.text "Some text for the card" )
        ]


book : ThemeList a -> Book
book themes =
    intoBook "Card" identity viewCard
        |> addStory (themeStory themes)
        |> addStory cardBodyStory
        |> addStory
            (Story "Elevated" []
                |> Story.addOption "True" True
                |> Story.addOption "False" False
            )
        |> buildBook
