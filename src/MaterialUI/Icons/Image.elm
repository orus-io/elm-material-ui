module MaterialUI.Icons.Image exposing
    ( add_a_photo
    , add_to_photos
    , adjust
    , assistant
    , assistant_photo
    , audiotrack
    , blur_circular
    , blur_linear
    , blur_off
    , blur_on
    , brightness_1
    , brightness_2
    , brightness_3
    , brightness_4
    , brightness_5
    , brightness_6
    , brightness_7
    , broken_image
    , brush
    , burst_mode
    , camera
    , camera_alt
    , camera_front
    , camera_rear
    , camera_roll
    , center_focus_strong
    , center_focus_weak
    , collections
    , collections_bookmark
    , color_lens
    , colorize
    , compare
    , control_point
    , control_point_duplicate
    , crop
    , crop_16_9
    , crop_3_2
    , crop_5_4
    , crop_7_5
    , crop_din
    , crop_free
    , crop_landscape
    , crop_original
    , crop_portrait
    , crop_rotate
    , crop_square
    , dehaze
    , details
    , edit
    , exposure
    , exposure_neg_1
    , exposure_neg_2
    , exposure_plus_1
    , exposure_plus_2
    , exposure_zero
    , filter
    , filter_1
    , filter_2
    , filter_3
    , filter_4
    , filter_5
    , filter_6
    , filter_7
    , filter_8
    , filter_9
    , filter_9_plus
    , filter_b_and_w
    , filter_center_focus
    , filter_drama
    , filter_frames
    , filter_hdr
    , filter_none
    , filter_tilt_shift
    , filter_vintage
    , flare
    , flash_auto
    , flash_off
    , flash_on
    , flip
    , gradient
    , grain
    , grid_off
    , grid_on
    , hdr_off
    , hdr_on
    , hdr_strong
    , hdr_weak
    , healing
    , image
    , image_aspect_ratio
    , iso
    , landscape
    , leak_add
    , leak_remove
    , lens
    , linked_camera
    , looks
    , looks_3
    , looks_4
    , looks_5
    , looks_6
    , looks_one
    , looks_two
    , loupe
    , monochrome_photos
    , movie_creation
    , movie_filter
    , music_note
    , nature
    , nature_people
    , navigate_before
    , navigate_next
    , palette
    , panorama
    , panorama_fish_eye
    , panorama_horizontal
    , panorama_vertical
    , panorama_wide_angle
    , photo
    , photo_album
    , photo_camera
    , photo_filter
    , photo_library
    , photo_size_select_actual
    , photo_size_select_large
    , photo_size_select_small
    , picture_as_pdf
    , portrait
    , remove_red_eye
    , rotate_90_degrees_ccw
    , rotate_left
    , rotate_right
    , slideshow
    , straighten
    , style
    , switch_camera
    , switch_video
    , tag_faces
    , texture
    , timelapse
    , timer
    , timer_10
    , timer_3
    , timer_off
    , tonality
    , transform
    , tune
    , view_comfy
    , view_compact
    , vignette
    , wb_auto
    , wb_cloudy
    , wb_incandescent
    , wb_iridescent
    , wb_sunny
    )

{-|


# Icons

@docs add_a_photo
@docs add_to_photos
@docs adjust
@docs assistant
@docs assistant_photo
@docs audiotrack
@docs blur_circular
@docs blur_linear
@docs blur_off
@docs blur_on
@docs brightness_1
@docs brightness_2
@docs brightness_3
@docs brightness_4
@docs brightness_5
@docs brightness_6
@docs brightness_7
@docs broken_image
@docs brush
@docs burst_mode
@docs camera
@docs camera_alt
@docs camera_front
@docs camera_rear
@docs camera_roll
@docs center_focus_strong
@docs center_focus_weak
@docs collections
@docs collections_bookmark
@docs color_lens
@docs colorize
@docs compare
@docs control_point
@docs control_point_duplicate
@docs crop
@docs crop_16_9
@docs crop_3_2
@docs crop_5_4
@docs crop_7_5
@docs crop_din
@docs crop_free
@docs crop_landscape
@docs crop_original
@docs crop_portrait
@docs crop_rotate
@docs crop_square
@docs dehaze
@docs details
@docs edit
@docs exposure
@docs exposure_neg_1
@docs exposure_neg_2
@docs exposure_plus_1
@docs exposure_plus_2
@docs exposure_zero
@docs filter
@docs filter_1
@docs filter_2
@docs filter_3
@docs filter_4
@docs filter_5
@docs filter_6
@docs filter_7
@docs filter_8
@docs filter_9
@docs filter_9_plus
@docs filter_b_and_w
@docs filter_center_focus
@docs filter_drama
@docs filter_frames
@docs filter_hdr
@docs filter_none
@docs filter_tilt_shift
@docs filter_vintage
@docs flare
@docs flash_auto
@docs flash_off
@docs flash_on
@docs flip
@docs gradient
@docs grain
@docs grid_off
@docs grid_on
@docs hdr_off
@docs hdr_on
@docs hdr_strong
@docs hdr_weak
@docs healing
@docs image
@docs image_aspect_ratio
@docs iso
@docs landscape
@docs leak_add
@docs leak_remove
@docs lens
@docs linked_camera
@docs looks
@docs looks_3
@docs looks_4
@docs looks_5
@docs looks_6
@docs looks_one
@docs looks_two
@docs loupe
@docs monochrome_photos
@docs movie_creation
@docs movie_filter
@docs music_note
@docs nature
@docs nature_people
@docs navigate_before
@docs navigate_next
@docs palette
@docs panorama
@docs panorama_fish_eye
@docs panorama_horizontal
@docs panorama_vertical
@docs panorama_wide_angle
@docs photo
@docs photo_album
@docs photo_camera
@docs photo_filter
@docs photo_library
@docs photo_size_select_actual
@docs photo_size_select_large
@docs photo_size_select_small
@docs picture_as_pdf
@docs portrait
@docs remove_red_eye
@docs rotate_90_degrees_ccw
@docs rotate_left
@docs rotate_right
@docs slideshow
@docs straighten
@docs style
@docs switch_camera
@docs switch_video
@docs tag_faces
@docs texture
@docs timelapse
@docs timer
@docs timer_10
@docs timer_3
@docs timer_off
@docs tonality
@docs transform
@docs tune
@docs view_comfy
@docs view_compact
@docs vignette
@docs wb_auto
@docs wb_cloudy
@docs wb_incandescent
@docs wb_iridescent
@docs wb_sunny

-}

import Material.Icons.Image as Image
import MaterialUI.Icon exposing (Icon, makeIcon)


add_a_photo : Icon msg
add_a_photo =
    makeIcon Image.add_a_photo


add_to_photos : Icon msg
add_to_photos =
    makeIcon Image.add_to_photos


adjust : Icon msg
adjust =
    makeIcon Image.adjust


assistant : Icon msg
assistant =
    makeIcon Image.assistant


assistant_photo : Icon msg
assistant_photo =
    makeIcon Image.assistant_photo


audiotrack : Icon msg
audiotrack =
    makeIcon Image.audiotrack


blur_circular : Icon msg
blur_circular =
    makeIcon Image.blur_circular


blur_linear : Icon msg
blur_linear =
    makeIcon Image.blur_linear


blur_off : Icon msg
blur_off =
    makeIcon Image.blur_off


blur_on : Icon msg
blur_on =
    makeIcon Image.blur_on


brightness_1 : Icon msg
brightness_1 =
    makeIcon Image.brightness_1


brightness_2 : Icon msg
brightness_2 =
    makeIcon Image.brightness_2


brightness_3 : Icon msg
brightness_3 =
    makeIcon Image.brightness_3


brightness_4 : Icon msg
brightness_4 =
    makeIcon Image.brightness_4


brightness_5 : Icon msg
brightness_5 =
    makeIcon Image.brightness_5


brightness_6 : Icon msg
brightness_6 =
    makeIcon Image.brightness_6


brightness_7 : Icon msg
brightness_7 =
    makeIcon Image.brightness_7


broken_image : Icon msg
broken_image =
    makeIcon Image.broken_image


brush : Icon msg
brush =
    makeIcon Image.brush


burst_mode : Icon msg
burst_mode =
    makeIcon Image.burst_mode


camera : Icon msg
camera =
    makeIcon Image.camera


camera_alt : Icon msg
camera_alt =
    makeIcon Image.camera_alt


camera_front : Icon msg
camera_front =
    makeIcon Image.camera_front


camera_rear : Icon msg
camera_rear =
    makeIcon Image.camera_rear


camera_roll : Icon msg
camera_roll =
    makeIcon Image.camera_roll


center_focus_strong : Icon msg
center_focus_strong =
    makeIcon Image.center_focus_strong


center_focus_weak : Icon msg
center_focus_weak =
    makeIcon Image.center_focus_weak


collections : Icon msg
collections =
    makeIcon Image.collections


collections_bookmark : Icon msg
collections_bookmark =
    makeIcon Image.collections_bookmark


color_lens : Icon msg
color_lens =
    makeIcon Image.color_lens


colorize : Icon msg
colorize =
    makeIcon Image.colorize


compare : Icon msg
compare =
    makeIcon Image.compare


control_point : Icon msg
control_point =
    makeIcon Image.control_point


control_point_duplicate : Icon msg
control_point_duplicate =
    makeIcon Image.control_point_duplicate


crop : Icon msg
crop =
    makeIcon Image.crop


crop_16_9 : Icon msg
crop_16_9 =
    makeIcon Image.crop_16_9


crop_3_2 : Icon msg
crop_3_2 =
    makeIcon Image.crop_3_2


crop_5_4 : Icon msg
crop_5_4 =
    makeIcon Image.crop_5_4


crop_7_5 : Icon msg
crop_7_5 =
    makeIcon Image.crop_7_5


crop_din : Icon msg
crop_din =
    makeIcon Image.crop_din


crop_free : Icon msg
crop_free =
    makeIcon Image.crop_free


crop_landscape : Icon msg
crop_landscape =
    makeIcon Image.crop_landscape


crop_original : Icon msg
crop_original =
    makeIcon Image.crop_original


crop_portrait : Icon msg
crop_portrait =
    makeIcon Image.crop_portrait


crop_rotate : Icon msg
crop_rotate =
    makeIcon Image.crop_rotate


crop_square : Icon msg
crop_square =
    makeIcon Image.crop_square


dehaze : Icon msg
dehaze =
    makeIcon Image.dehaze


details : Icon msg
details =
    makeIcon Image.details


edit : Icon msg
edit =
    makeIcon Image.edit


exposure : Icon msg
exposure =
    makeIcon Image.exposure


exposure_neg_1 : Icon msg
exposure_neg_1 =
    makeIcon Image.exposure_neg_1


exposure_neg_2 : Icon msg
exposure_neg_2 =
    makeIcon Image.exposure_neg_2


exposure_plus_1 : Icon msg
exposure_plus_1 =
    makeIcon Image.exposure_plus_1


exposure_plus_2 : Icon msg
exposure_plus_2 =
    makeIcon Image.exposure_plus_2


exposure_zero : Icon msg
exposure_zero =
    makeIcon Image.exposure_zero


filter : Icon msg
filter =
    makeIcon Image.filter


filter_1 : Icon msg
filter_1 =
    makeIcon Image.filter_1


filter_2 : Icon msg
filter_2 =
    makeIcon Image.filter_2


filter_3 : Icon msg
filter_3 =
    makeIcon Image.filter_3


filter_4 : Icon msg
filter_4 =
    makeIcon Image.filter_4


filter_5 : Icon msg
filter_5 =
    makeIcon Image.filter_5


filter_6 : Icon msg
filter_6 =
    makeIcon Image.filter_6


filter_7 : Icon msg
filter_7 =
    makeIcon Image.filter_7


filter_8 : Icon msg
filter_8 =
    makeIcon Image.filter_8


filter_9 : Icon msg
filter_9 =
    makeIcon Image.filter_9


filter_9_plus : Icon msg
filter_9_plus =
    makeIcon Image.filter_9_plus


filter_b_and_w : Icon msg
filter_b_and_w =
    makeIcon Image.filter_b_and_w


filter_center_focus : Icon msg
filter_center_focus =
    makeIcon Image.filter_center_focus


filter_drama : Icon msg
filter_drama =
    makeIcon Image.filter_drama


filter_frames : Icon msg
filter_frames =
    makeIcon Image.filter_frames


filter_hdr : Icon msg
filter_hdr =
    makeIcon Image.filter_hdr


filter_none : Icon msg
filter_none =
    makeIcon Image.filter_none


filter_tilt_shift : Icon msg
filter_tilt_shift =
    makeIcon Image.filter_tilt_shift


filter_vintage : Icon msg
filter_vintage =
    makeIcon Image.filter_vintage


flare : Icon msg
flare =
    makeIcon Image.flare


flash_auto : Icon msg
flash_auto =
    makeIcon Image.flash_auto


flash_off : Icon msg
flash_off =
    makeIcon Image.flash_off


flash_on : Icon msg
flash_on =
    makeIcon Image.flash_on


flip : Icon msg
flip =
    makeIcon Image.flip


gradient : Icon msg
gradient =
    makeIcon Image.gradient


grain : Icon msg
grain =
    makeIcon Image.grain


grid_off : Icon msg
grid_off =
    makeIcon Image.grid_off


grid_on : Icon msg
grid_on =
    makeIcon Image.grid_on


hdr_off : Icon msg
hdr_off =
    makeIcon Image.hdr_off


hdr_on : Icon msg
hdr_on =
    makeIcon Image.hdr_on


hdr_strong : Icon msg
hdr_strong =
    makeIcon Image.hdr_strong


hdr_weak : Icon msg
hdr_weak =
    makeIcon Image.hdr_weak


healing : Icon msg
healing =
    makeIcon Image.healing


image : Icon msg
image =
    makeIcon Image.image


image_aspect_ratio : Icon msg
image_aspect_ratio =
    makeIcon Image.image_aspect_ratio


iso : Icon msg
iso =
    makeIcon Image.iso


landscape : Icon msg
landscape =
    makeIcon Image.landscape


leak_add : Icon msg
leak_add =
    makeIcon Image.leak_add


leak_remove : Icon msg
leak_remove =
    makeIcon Image.leak_remove


lens : Icon msg
lens =
    makeIcon Image.lens


linked_camera : Icon msg
linked_camera =
    makeIcon Image.linked_camera


looks : Icon msg
looks =
    makeIcon Image.looks


looks_3 : Icon msg
looks_3 =
    makeIcon Image.looks_3


looks_4 : Icon msg
looks_4 =
    makeIcon Image.looks_4


looks_5 : Icon msg
looks_5 =
    makeIcon Image.looks_5


looks_6 : Icon msg
looks_6 =
    makeIcon Image.looks_6


looks_one : Icon msg
looks_one =
    makeIcon Image.looks_one


looks_two : Icon msg
looks_two =
    makeIcon Image.looks_two


loupe : Icon msg
loupe =
    makeIcon Image.loupe


monochrome_photos : Icon msg
monochrome_photos =
    makeIcon Image.monochrome_photos


movie_creation : Icon msg
movie_creation =
    makeIcon Image.movie_creation


movie_filter : Icon msg
movie_filter =
    makeIcon Image.movie_filter


music_note : Icon msg
music_note =
    makeIcon Image.music_note


nature : Icon msg
nature =
    makeIcon Image.nature


nature_people : Icon msg
nature_people =
    makeIcon Image.nature_people


navigate_before : Icon msg
navigate_before =
    makeIcon Image.navigate_before


navigate_next : Icon msg
navigate_next =
    makeIcon Image.navigate_next


palette : Icon msg
palette =
    makeIcon Image.palette


panorama : Icon msg
panorama =
    makeIcon Image.panorama


panorama_fish_eye : Icon msg
panorama_fish_eye =
    makeIcon Image.panorama_fish_eye


panorama_horizontal : Icon msg
panorama_horizontal =
    makeIcon Image.panorama_horizontal


panorama_vertical : Icon msg
panorama_vertical =
    makeIcon Image.panorama_vertical


panorama_wide_angle : Icon msg
panorama_wide_angle =
    makeIcon Image.panorama_wide_angle


photo : Icon msg
photo =
    makeIcon Image.photo


photo_album : Icon msg
photo_album =
    makeIcon Image.photo_album


photo_camera : Icon msg
photo_camera =
    makeIcon Image.photo_camera


photo_filter : Icon msg
photo_filter =
    makeIcon Image.photo_filter


photo_library : Icon msg
photo_library =
    makeIcon Image.photo_library


photo_size_select_actual : Icon msg
photo_size_select_actual =
    makeIcon Image.photo_size_select_actual


photo_size_select_large : Icon msg
photo_size_select_large =
    makeIcon Image.photo_size_select_large


photo_size_select_small : Icon msg
photo_size_select_small =
    makeIcon Image.photo_size_select_small


picture_as_pdf : Icon msg
picture_as_pdf =
    makeIcon Image.picture_as_pdf


portrait : Icon msg
portrait =
    makeIcon Image.portrait


remove_red_eye : Icon msg
remove_red_eye =
    makeIcon Image.remove_red_eye


rotate_90_degrees_ccw : Icon msg
rotate_90_degrees_ccw =
    makeIcon Image.rotate_90_degrees_ccw


rotate_left : Icon msg
rotate_left =
    makeIcon Image.rotate_left


rotate_right : Icon msg
rotate_right =
    makeIcon Image.rotate_right


slideshow : Icon msg
slideshow =
    makeIcon Image.slideshow


straighten : Icon msg
straighten =
    makeIcon Image.straighten


style : Icon msg
style =
    makeIcon Image.style


switch_camera : Icon msg
switch_camera =
    makeIcon Image.switch_camera


switch_video : Icon msg
switch_video =
    makeIcon Image.switch_video


tag_faces : Icon msg
tag_faces =
    makeIcon Image.tag_faces


texture : Icon msg
texture =
    makeIcon Image.texture


timelapse : Icon msg
timelapse =
    makeIcon Image.timelapse


timer : Icon msg
timer =
    makeIcon Image.timer


timer_10 : Icon msg
timer_10 =
    makeIcon Image.timer_10


timer_3 : Icon msg
timer_3 =
    makeIcon Image.timer_3


timer_off : Icon msg
timer_off =
    makeIcon Image.timer_off


tonality : Icon msg
tonality =
    makeIcon Image.tonality


transform : Icon msg
transform =
    makeIcon Image.transform


tune : Icon msg
tune =
    makeIcon Image.tune


view_comfy : Icon msg
view_comfy =
    makeIcon Image.view_comfy


view_compact : Icon msg
view_compact =
    makeIcon Image.view_compact


vignette : Icon msg
vignette =
    makeIcon Image.vignette


wb_auto : Icon msg
wb_auto =
    makeIcon Image.wb_auto


wb_cloudy : Icon msg
wb_cloudy =
    makeIcon Image.wb_cloudy


wb_incandescent : Icon msg
wb_incandescent =
    makeIcon Image.wb_incandescent


wb_iridescent : Icon msg
wb_iridescent =
    makeIcon Image.wb_iridescent


wb_sunny : Icon msg
wb_sunny =
    makeIcon Image.wb_sunny
