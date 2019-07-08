module MaterialUI.StoryBook exposing (shelf)

import Bibliopola exposing (Program, Shelf, addBook, addShelf)
import MaterialUI.ButtonTest
import MaterialUI.Theme exposing (Theme)


shelf : List ( String, Theme a ) -> Shelf
shelf themes =
    Bibliopola.emptyShelf "MaterialUI"
        |> addShelf (MaterialUI.ButtonTest.shelf themes)


main : Program
main =
    shelf []
        |> Bibliopola.fromShelf
