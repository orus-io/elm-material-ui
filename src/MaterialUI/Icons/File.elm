module MaterialUI.Icons.File exposing
    ( attachment
    , cloud
    , cloud_circle
    , cloud_done
    , cloud_download
    , cloud_off
    , cloud_queue
    , cloud_upload
    , create_new_folder
    , file_download
    , file_upload
    , folder
    , folder_open
    , folder_shared
    )

{-|


# Icons

@docs attachment
@docs cloud
@docs cloud_circle
@docs cloud_done
@docs cloud_download
@docs cloud_off
@docs cloud_queue
@docs cloud_upload
@docs create_new_folder
@docs file_download
@docs file_upload
@docs folder
@docs folder_open
@docs folder_shared

-}

import Material.Icons.File as File
import MaterialUI.Icon exposing (Icon, makeIcon)


attachment : Icon msg
attachment =
    makeIcon File.attachment


cloud : Icon msg
cloud =
    makeIcon File.cloud


cloud_circle : Icon msg
cloud_circle =
    makeIcon File.cloud_circle


cloud_done : Icon msg
cloud_done =
    makeIcon File.cloud_done


cloud_download : Icon msg
cloud_download =
    makeIcon File.cloud_download


cloud_off : Icon msg
cloud_off =
    makeIcon File.cloud_off


cloud_queue : Icon msg
cloud_queue =
    makeIcon File.cloud_queue


cloud_upload : Icon msg
cloud_upload =
    makeIcon File.cloud_upload


create_new_folder : Icon msg
create_new_folder =
    makeIcon File.create_new_folder


file_download : Icon msg
file_download =
    makeIcon File.file_download


file_upload : Icon msg
file_upload =
    makeIcon File.file_upload


folder : Icon msg
folder =
    makeIcon File.folder


folder_open : Icon msg
folder_open =
    makeIcon File.folder_open


folder_shared : Icon msg
folder_shared =
    makeIcon File.folder_shared
