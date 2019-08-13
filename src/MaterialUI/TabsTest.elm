module MaterialUI.TabsTest exposing (book)

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
import MaterialUI.Tabs as Tabs
import MaterialUI.TestUtils
    exposing
        ( booleanStory
        , colorStory
        , labelStory
        , render
        , themeStory
        )
import MaterialUI.Theme as Theme exposing (Theme)


viewTabs :
    Theme a
    -> Theme.Color a
    -> Element.Length
    -> Bool
    -> Tabs.IconPosition
    -> Maybe Int
    -> Maybe (Int -> String)
    -> Bool
    -> Element String
viewTabs theme color width fixed iconpos selected onPress disabled =
    Tabs.tabs
        [ Element.width width
        , Border.width 1
        , Border.dashed
        , Border.color <| Theme.setAlpha 0.3 (Theme.getColor Theme.OnSurface theme)
        ]
        { color = color
        , disabled = disabled
        , selected = selected
        , onPress = onPress
        , fixed = fixed
        , iconPos = iconpos
        , tabs =
            [ Tabs.Label "First Tab" <| Just Action.accessible
            , Tabs.Label "Second Tab" Nothing
            , Tabs.Label "Third Tab" <| Just Action.alarm
            ]
        }
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


iconPositionStory : Story Tabs.IconPosition
iconPositionStory =
    Story "IconPosition"
        [ ( "LeadingIcon", Tabs.LeadingIcon )
        , ( "TopIcon", Tabs.TopIcon )
        , ( "OnlyIcon", Tabs.OnlyIcon )
        ]


widthStory : Story Element.Length
widthStory =
    Story "Width"
        [ ( "300px", Element.px 300 )
        , ( "600px", Element.px 600 )
        , ( "100px", Element.px 100 )
        ]


book : List ( String, Theme a ) -> Book
book themes =
    Bibliopola.intoBook "Tabs" identity viewTabs
        |> addStory (themeStory themes)
        |> addStory colorStory
        |> addStory widthStory
        |> addStory (booleanStory "fixed" True)
        |> addStory iconPositionStory
        |> addStory selectedStory
        |> addStory onPressStory
        |> addStory (booleanStory "disabled" False)
        |> buildBook
