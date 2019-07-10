module MaterialUI.StoryBook exposing (shelf)

import Bibliopola exposing (Program, Shelf, addBook, addShelf)
import MaterialUI.ButtonTest
import MaterialUI.CardTest
import MaterialUI.TextFieldTest
import MaterialUI.Theme exposing (Theme)
import MaterialUI.Themes.Dark


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    Bibliopola.emptyShelf "MaterialUI"
        |> addShelf (MaterialUI.ButtonTest.shelf themes)
        |> addBook (MaterialUI.CardTest.book themes)
        |> addShelf (MaterialUI.TextFieldTest.shelf themes)


main : Program
main =
    shelf
        [ ( "Dark", MaterialUI.Themes.Dark.theme )
        ]
        |> Bibliopola.fromShelf
