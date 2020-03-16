module MaterialUI.TableTest exposing (book)

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
import Element.Border as Border
import MaterialUI.Icon exposing (Icon)
import MaterialUI.Icons.Action as Action
import MaterialUI.Icons.Content as Content
import MaterialUI.Table as Table
import MaterialUI.TestUtils
    exposing
        ( booleanStory
        , colorStory
        , labelStory
        , render
        , themeStory
        )
import MaterialUI.Theme as Theme exposing (Theme)


tableConfig : Table.Config Sight String
tableConfig =
    { columns =
        [ { header = Element.text "name"
          , width = Element.shrink
          , view = \sight -> Element.text sight.name
          }
        , { header = Element.text "duration"
          , width = Element.shrink
          , view = \sight -> Element.text (String.fromInt sight.time ++ "s")
          }
        ]
    }


viewTable :
    Theme a
    -> Maybe (Int -> String)
    -> Bool
    -> Element String
viewTable theme onPress disabled =
    Table.table
        tableConfig
        -- [ Element.width width
        -- , Border.width 1
        -- , Border.dashed
        -- , Border.color <| Theme.setAlpha 0.3 (Theme.getColor Theme.OnSurface theme)
        -- ]
        missionSights
        |> render theme


selectedStory : Story (Maybe Int)
selectedStory =
    Story "Selected"
        [ ( "0", Just 0 )
        , ( "Nothing", Nothing )
        , ( "1", Just 1 )
        , ( "2", Just 2 )
        , ( "3", Just 3 )
        , ( "4", Just 4 )
        ]


onPressStory : Story (Maybe (Int -> String))
onPressStory =
    Story "onPress"
        [ ( "Something", Just (\i -> "Pressed " ++ String.fromInt i) )
        , ( "Nothing", Nothing )
        ]


book : List ( String, Theme a ) -> Book
book themes =
    Bibliopola.intoBook "Table" identity viewTable
        |> addStory (themeStory themes)
        |> addStory onPressStory
        |> addStory (booleanStory "disabled" False)
        |> buildBook



-- SIGHTS


type alias Duration =
    Int


type alias Sight =
    { name : String
    , time : Duration
    , price : Float
    , rating : Float
    , selected : Bool
    }


minute : Duration
minute =
    60


hour : Duration
hour =
    3600


missionSights : List Sight
missionSights =
    [ Sight "Eat a Burrito" (30 * minute) 7 4.6 False
    , Sight "Buy drugs in Dolores park" hour 20 4.8 False
    , Sight "Armory Tour" (1 * hour + 30 * minute) 27 4.5 False
    , Sight "Tartine Bakery" hour 10 4.1 False
    , Sight "Have Brunch" (2 * hour) 25 4.2 False
    , Sight "Get catcalled at BART" (5 * minute) 0 1.6 False
    , Sight "Buy a painting at \"Stuff\"" (45 * minute) 400 4.7 False
    , Sight "McDonalds at 24th" (20 * minute) 5 2.8 False
    ]
