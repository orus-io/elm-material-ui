module MaterialUI.ButtonRowTest exposing (book)

import Bibliopola exposing (Book, Story, addStory, buildBook)
import Element exposing (Attribute, Element)
import Element.Border as Border
import MaterialUI.Button as Button
import MaterialUI.ButtonRow as ButtonRow
import MaterialUI.TestUtils exposing (ThemeList, render, themeStory)
import MaterialUI.Theme as Theme exposing (Theme)


type alias ButtonRowFn a msg =
    List (Attribute msg) -> List (Theme.Theme a -> Element msg) -> Theme.Theme a -> Element msg


viewButtonRow : Theme a -> ButtonRowFn a String -> Element.Length -> List (Theme a -> Element String) -> Element String
viewButtonRow theme view width buttons =
    view [ Border.width 1, Element.width width ] buttons
        |> render theme


typeStory : Story (ButtonRowFn a msg)
typeStory =
    Story "Type"
        [ ( "Row", ButtonRow.row )
        , ( "Stacked", ButtonRow.stacked )
        ]


btnlistStory : Story (List (Theme a -> Element String))
btnlistStory =
    Story "Buttons"
        [ ( "Two"
          , [ Button.contained
                { icon = Nothing
                , color = Theme.Primary
                , text = "Main action"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Secondary action"
                , onPress = Nothing
                , disabled = False
                }
            ]
          )
        , ( "One"
          , [ Button.contained
                { icon = Nothing
                , color = Theme.Primary
                , text = "Main action"
                , onPress = Nothing
                , disabled = False
                }
            ]
          )
        , ( "Three"
          , [ Button.outlined
                { icon = Nothing
                , color = Theme.Primary
                , text = "Main"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Second"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Third"
                , onPress = Nothing
                , disabled = False
                }
            ]
          )
        , ( "Four"
          , [ Button.contained
                { icon = Nothing
                , color = Theme.Primary
                , text = "Main action"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Second"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Third"
                , onPress = Nothing
                , disabled = False
                }
            , Button.text
                { icon = Nothing
                , color = Theme.Primary
                , text = "Fourth"
                , onPress = Nothing
                , disabled = False
                }
            ]
          )
        ]


widthStory : Story Element.Length
widthStory =
    Story "Width"
        [ ( "400px", Element.px 400 )
        , ( "200px", Element.px 200 )
        , ( "800px", Element.px 800 )
        ]


book : ThemeList a -> Book
book themes =
    Bibliopola.intoBook "ButtonRow" identity viewButtonRow
        |> addStory (themeStory themes)
        |> addStory typeStory
        |> addStory widthStory
        |> addStory btnlistStory
        |> buildBook
