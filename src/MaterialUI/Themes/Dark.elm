module MaterialUI.Themes.Dark exposing (theme)

import Color
import Element
import MaterialColor
import MaterialUI.Theme exposing (Theme, defaultTheme, toElementColor)


theme : Theme a
theme =
    let
        color =
            defaultTheme.color
    in
    { defaultTheme
        | color =
            { color
                | isDark = True
                , primary = Element.rgb255 187 134 252 -- #BB86FC
                , secondaryVariant = Element.rgb255 3 218 198 -- #03DAC6
                , background = Element.rgb255 18 18 18 -- #121212
                , surface = Element.rgb255 18 18 18 -- #121212
                , error = Element.rgb255 207 102 121 -- #cf6679
                , onPrimary = toElementColor Color.black
                , onSecondaryVariant = toElementColor Color.black
                , onBackground = toElementColor Color.white
                , onSurface = toElementColor Color.white
                , onError = toElementColor Color.black
                , alternative = []
            }
    }
