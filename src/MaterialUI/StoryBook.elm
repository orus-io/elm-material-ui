module MaterialUI.StoryBook exposing (shelf)

import Bibliopola exposing (Program, Shelf, addBook, addShelf)
import MaterialUI.ButtonRowTest
import MaterialUI.ButtonTest
import MaterialUI.CardTest
import MaterialUI.RadioTest
import MaterialUI.TextFieldTest
import MaterialUI.Theme exposing (Theme)
import MaterialUI.Themes.Dark


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    Bibliopola.emptyShelf "MaterialUI"
        |> addShelf
            (Bibliopola.emptyShelf "Inputs"
                |> addShelf (MaterialUI.ButtonTest.shelf themes)
                |> addShelf (MaterialUI.TextFieldTest.shelf themes)
                |> addBook (MaterialUI.RadioTest.book themes)
            )
        |> addShelf
            (Bibliopola.emptyShelf "Containers"
                |> addBook (MaterialUI.CardTest.book themes)
                |> addBook (MaterialUI.ButtonRowTest.book themes)
            )


main : Program
main =
    shelf
        [ ( "Dark", MaterialUI.Themes.Dark.theme )
        ]
        |> Bibliopola.fromShelf
