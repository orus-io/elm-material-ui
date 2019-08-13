module MaterialUI.Icons.Alert exposing
    ( add_alert
    , error
    , error_outline
    , warning
    )

{-|


# Icons

@docs add_alert
@docs error
@docs error_outline
@docs warning

-}

import Material.Icons.Alert as Alert
import MaterialUI.Icon exposing (Icon, makeIcon)


add_alert : Icon msg
add_alert =
    makeIcon Alert.add_alert


error : Icon msg
error =
    makeIcon Alert.error


error_outline : Icon msg
error_outline =
    makeIcon Alert.error_outline


warning : Icon msg
warning =
    makeIcon Alert.warning
