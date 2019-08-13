module MaterialUI.Icons.Action exposing
    ( accessibility
    , accessible
    , account_balance
    , account_balance_with_wallet
    , account_box
    , account_circle
    , add_shopping_cart
    , alarm
    , alarm_add
    , alarm_off
    , alarm_on
    , all_out
    , android
    , announcement
    , aspect_ratio
    , assessment
    , assignment
    , assignment_ind
    , assignment_late
    , assignment_return
    , assignment_returned
    , assignment_turned_in
    , autorenew
    , backup
    , book
    , bookmark
    , bookmark_border
    , bug_report
    , build
    , cached
    , camera_enhance
    , card_giftcard
    , card_membership
    , card_travel
    , change_history
    , check_circle
    , chrome_reader_mode
    , class
    , code
    , compare_arrows
    , copyright
    , credit_card
    , dashboard
    , date_range
    , delete
    , delete_forever
    , description
    , dns
    , done
    , done_all
    , donut_large
    , donut_small
    , eject
    , euro_symbol
    , event
    , event_seat
    , exit_to_app
    , explore
    , extension
    , face
    , favorite
    , favorite_border
    , feedback
    , find_in_page
    , find_replace
    , fingerprint
    , flight_land
    , flight_takeoff
    , flip_to_back
    , flip_to_front
    , g_translate
    , gavel
    , get_app
    , gif
    , grade
    , group_work
    , help
    , help_outline
    , highlight_off
    , history
    , home
    , hourglass_empty
    , hourglass_full
    , http
    , https
    , important_devices
    , info
    , info_outline
    , input
    , invert_colors
    , label
    , label_outline
    , language
    , launch
    , lightbulb_outline
    , line_style
    , line_weight
    , list
    , lock
    , lock_open
    , lock_outline
    , loyalty
    , markunread_mailbox
    , motorcycle
    , note_add
    , offline_pin
    , opacity
    , open_in_browser
    , open_in_new
    , open_with
    , pageview
    , pan_tool
    , payment
    , perm_camera_mic
    , perm_contact_calendar
    , perm_data_setting
    , perm_device_information
    , perm_identity
    , perm_media
    , perm_phone_msg
    , perm_scan_wifi
    , pets
    , picture_in_picture
    , picture_in_picture_alt
    , play_for_work
    , polymer
    , power_settings_new
    , pregnant_woman
    , print
    , query_builder
    , question_answer
    , receipt
    , record_voice_over
    , redeem
    , remove_shopping_cart
    , reorder
    , report_problem
    , restore
    , restore_page
    , room
    , rounded_corner
    , rowing
    , schedule
    , search
    , settings
    , settings_application
    , settings_backup_restore
    , settings_bluetooth
    , settings_brightness
    , settings_cell
    , settings_ethernet
    , settings_input_antenna
    , settings_input_component
    , settings_input_composite
    , settings_input_hdmi
    , settings_input_svideo
    , settings_overscan
    , settings_phone
    , settings_power
    , settings_remote
    , settings_voice
    , shop
    , shop_two
    , shopping_basket
    , shopping_cart
    , speaker_notes
    , speaker_notes_off
    , spellcheck
    , star_rate
    , stars
    , store
    , subject
    , supervisor_account
    , swap_horiz
    , swap_vert
    , swap_vertical_circle
    , system_update_alt
    , tab
    , tab_unselected
    , theaters
    , three_d_rotation
    , thumb_down
    , thumb_up
    , thumbs_up_down
    , timeline
    , toc
    , today
    , toll
    , touch_app
    , track_changes
    , translate
    , trending_down
    , trending_flat
    , trending_up
    , turned_in
    , turned_in_not
    , update
    , verified_user
    , view_agenda
    , view_array
    , view_carousel
    , view_column
    , view_day
    , view_headline
    , view_list
    , view_module
    , view_quilt
    , view_stream
    , view_week
    , visibility
    , visibility_off
    , watch_later
    , work
    , youtube_searched_for
    , zoom_in
    , zoom_out
    )

{-|


# Icons

@docs accessibility
@docs accessible
@docs account_balance
@docs account_balance_with_wallet
@docs account_box
@docs account_circle
@docs add_shopping_cart
@docs alarm
@docs alarm_add
@docs alarm_off
@docs alarm_on
@docs all_out
@docs android
@docs announcement
@docs aspect_ratio
@docs assessment
@docs assignment
@docs assignment_ind
@docs assignment_late
@docs assignment_return
@docs assignment_returned
@docs assignment_turned_in
@docs autorenew
@docs backup
@docs book
@docs bookmark
@docs bookmark_border
@docs bug_report
@docs build
@docs cached
@docs camera_enhance
@docs card_giftcard
@docs card_membership
@docs card_travel
@docs change_history
@docs check_circle
@docs chrome_reader_mode
@docs class
@docs code
@docs compare_arrows
@docs copyright
@docs credit_card
@docs dashboard
@docs date_range
@docs delete
@docs delete_forever
@docs description
@docs dns
@docs done
@docs done_all
@docs donut_large
@docs donut_small
@docs eject
@docs euro_symbol
@docs event
@docs event_seat
@docs exit_to_app
@docs explore
@docs extension
@docs face
@docs favorite
@docs favorite_border
@docs feedback
@docs find_in_page
@docs find_replace
@docs fingerprint
@docs flight_land
@docs flight_takeoff
@docs flip_to_back
@docs flip_to_front
@docs g_translate
@docs gavel
@docs get_app
@docs gif
@docs grade
@docs group_work
@docs help
@docs help_outline
@docs highlight_off
@docs history
@docs home
@docs hourglass_empty
@docs hourglass_full
@docs http
@docs https
@docs important_devices
@docs info
@docs info_outline
@docs input
@docs invert_colors
@docs label
@docs label_outline
@docs language
@docs launch
@docs lightbulb_outline
@docs line_style
@docs line_weight
@docs list
@docs lock
@docs lock_open
@docs lock_outline
@docs loyalty
@docs markunread_mailbox
@docs motorcycle
@docs note_add
@docs offline_pin
@docs opacity
@docs open_in_browser
@docs open_in_new
@docs open_with
@docs pageview
@docs pan_tool
@docs payment
@docs perm_camera_mic
@docs perm_contact_calendar
@docs perm_data_setting
@docs perm_device_information
@docs perm_identity
@docs perm_media
@docs perm_phone_msg
@docs perm_scan_wifi
@docs pets
@docs picture_in_picture
@docs picture_in_picture_alt
@docs play_for_work
@docs polymer
@docs power_settings_new
@docs pregnant_woman
@docs print
@docs query_builder
@docs question_answer
@docs receipt
@docs record_voice_over
@docs redeem
@docs remove_shopping_cart
@docs reorder
@docs report_problem
@docs restore
@docs restore_page
@docs room
@docs rounded_corner
@docs rowing
@docs schedule
@docs search
@docs settings
@docs settings_application
@docs settings_backup_restore
@docs settings_bluetooth
@docs settings_brightness
@docs settings_cell
@docs settings_ethernet
@docs settings_input_antenna
@docs settings_input_component
@docs settings_input_composite
@docs settings_input_hdmi
@docs settings_input_svideo
@docs settings_overscan
@docs settings_phone
@docs settings_power
@docs settings_remote
@docs settings_voice
@docs shop
@docs shop_two
@docs shopping_basket
@docs shopping_cart
@docs speaker_notes
@docs speaker_notes_off
@docs spellcheck
@docs star_rate
@docs stars
@docs store
@docs subject
@docs supervisor_account
@docs swap_horiz
@docs swap_vert
@docs swap_vertical_circle
@docs system_update_alt
@docs tab
@docs tab_unselected
@docs theaters
@docs three_d_rotation
@docs thumb_down
@docs thumb_up
@docs thumbs_up_down
@docs timeline
@docs toc
@docs today
@docs toll
@docs touch_app
@docs track_changes
@docs translate
@docs trending_down
@docs trending_flat
@docs trending_up
@docs turned_in
@docs turned_in_not
@docs update
@docs verified_user
@docs view_agenda
@docs view_array
@docs view_carousel
@docs view_column
@docs view_day
@docs view_headline
@docs view_list
@docs view_module
@docs view_quilt
@docs view_stream
@docs view_week
@docs visibility
@docs visibility_off
@docs watch_later
@docs work
@docs youtube_searched_for
@docs zoom_in
@docs zoom_out

-}

import Material.Icons.Action as Action
import MaterialUI.Icon exposing (Icon, makeIcon)


accessibility : Icon msg
accessibility =
    makeIcon Action.accessibility


accessible : Icon msg
accessible =
    makeIcon Action.accessible


account_balance : Icon msg
account_balance =
    makeIcon Action.account_balance


account_balance_with_wallet : Icon msg
account_balance_with_wallet =
    makeIcon Action.account_balance_with_wallet


account_box : Icon msg
account_box =
    makeIcon Action.account_box


account_circle : Icon msg
account_circle =
    makeIcon Action.account_circle


add_shopping_cart : Icon msg
add_shopping_cart =
    makeIcon Action.add_shopping_cart


alarm : Icon msg
alarm =
    makeIcon Action.alarm


alarm_add : Icon msg
alarm_add =
    makeIcon Action.alarm_add


alarm_off : Icon msg
alarm_off =
    makeIcon Action.alarm_off


alarm_on : Icon msg
alarm_on =
    makeIcon Action.alarm_on


all_out : Icon msg
all_out =
    makeIcon Action.all_out


android : Icon msg
android =
    makeIcon Action.android


announcement : Icon msg
announcement =
    makeIcon Action.announcement


aspect_ratio : Icon msg
aspect_ratio =
    makeIcon Action.aspect_ratio


assessment : Icon msg
assessment =
    makeIcon Action.assessment


assignment : Icon msg
assignment =
    makeIcon Action.assignment


assignment_ind : Icon msg
assignment_ind =
    makeIcon Action.assignment_ind


assignment_late : Icon msg
assignment_late =
    makeIcon Action.assignment_late


assignment_return : Icon msg
assignment_return =
    makeIcon Action.assignment_return


assignment_returned : Icon msg
assignment_returned =
    makeIcon Action.assignment_returned


assignment_turned_in : Icon msg
assignment_turned_in =
    makeIcon Action.assignment_turned_in


autorenew : Icon msg
autorenew =
    makeIcon Action.autorenew


backup : Icon msg
backup =
    makeIcon Action.backup


book : Icon msg
book =
    makeIcon Action.book


bookmark : Icon msg
bookmark =
    makeIcon Action.bookmark


bookmark_border : Icon msg
bookmark_border =
    makeIcon Action.bookmark_border


bug_report : Icon msg
bug_report =
    makeIcon Action.bug_report


build : Icon msg
build =
    makeIcon Action.build


cached : Icon msg
cached =
    makeIcon Action.cached


camera_enhance : Icon msg
camera_enhance =
    makeIcon Action.camera_enhance


card_giftcard : Icon msg
card_giftcard =
    makeIcon Action.card_giftcard


card_membership : Icon msg
card_membership =
    makeIcon Action.card_membership


card_travel : Icon msg
card_travel =
    makeIcon Action.card_travel


change_history : Icon msg
change_history =
    makeIcon Action.change_history


check_circle : Icon msg
check_circle =
    makeIcon Action.check_circle


chrome_reader_mode : Icon msg
chrome_reader_mode =
    makeIcon Action.chrome_reader_mode


class : Icon msg
class =
    makeIcon Action.class


code : Icon msg
code =
    makeIcon Action.code


compare_arrows : Icon msg
compare_arrows =
    makeIcon Action.compare_arrows


copyright : Icon msg
copyright =
    makeIcon Action.copyright


credit_card : Icon msg
credit_card =
    makeIcon Action.credit_card


dashboard : Icon msg
dashboard =
    makeIcon Action.dashboard


date_range : Icon msg
date_range =
    makeIcon Action.date_range


delete : Icon msg
delete =
    makeIcon Action.delete


delete_forever : Icon msg
delete_forever =
    makeIcon Action.delete_forever


description : Icon msg
description =
    makeIcon Action.description


dns : Icon msg
dns =
    makeIcon Action.dns


done : Icon msg
done =
    makeIcon Action.done


done_all : Icon msg
done_all =
    makeIcon Action.done_all


donut_large : Icon msg
donut_large =
    makeIcon Action.donut_large


donut_small : Icon msg
donut_small =
    makeIcon Action.donut_small


eject : Icon msg
eject =
    makeIcon Action.eject


euro_symbol : Icon msg
euro_symbol =
    makeIcon Action.euro_symbol


event : Icon msg
event =
    makeIcon Action.event


event_seat : Icon msg
event_seat =
    makeIcon Action.event_seat


exit_to_app : Icon msg
exit_to_app =
    makeIcon Action.exit_to_app


explore : Icon msg
explore =
    makeIcon Action.explore


extension : Icon msg
extension =
    makeIcon Action.extension


face : Icon msg
face =
    makeIcon Action.face


favorite : Icon msg
favorite =
    makeIcon Action.favorite


favorite_border : Icon msg
favorite_border =
    makeIcon Action.favorite_border


feedback : Icon msg
feedback =
    makeIcon Action.feedback


find_in_page : Icon msg
find_in_page =
    makeIcon Action.find_in_page


find_replace : Icon msg
find_replace =
    makeIcon Action.find_replace


fingerprint : Icon msg
fingerprint =
    makeIcon Action.fingerprint


flight_land : Icon msg
flight_land =
    makeIcon Action.flight_land


flight_takeoff : Icon msg
flight_takeoff =
    makeIcon Action.flight_takeoff


flip_to_back : Icon msg
flip_to_back =
    makeIcon Action.flip_to_back


flip_to_front : Icon msg
flip_to_front =
    makeIcon Action.flip_to_front


g_translate : Icon msg
g_translate =
    makeIcon Action.g_translate


gavel : Icon msg
gavel =
    makeIcon Action.gavel


get_app : Icon msg
get_app =
    makeIcon Action.get_app


gif : Icon msg
gif =
    makeIcon Action.gif


grade : Icon msg
grade =
    makeIcon Action.grade


group_work : Icon msg
group_work =
    makeIcon Action.group_work


help : Icon msg
help =
    makeIcon Action.help


help_outline : Icon msg
help_outline =
    makeIcon Action.help_outline


highlight_off : Icon msg
highlight_off =
    makeIcon Action.highlight_off


history : Icon msg
history =
    makeIcon Action.history


home : Icon msg
home =
    makeIcon Action.home


hourglass_empty : Icon msg
hourglass_empty =
    makeIcon Action.hourglass_empty


hourglass_full : Icon msg
hourglass_full =
    makeIcon Action.hourglass_full


http : Icon msg
http =
    makeIcon Action.http


https : Icon msg
https =
    makeIcon Action.https


important_devices : Icon msg
important_devices =
    makeIcon Action.important_devices


info : Icon msg
info =
    makeIcon Action.info


info_outline : Icon msg
info_outline =
    makeIcon Action.info_outline


input : Icon msg
input =
    makeIcon Action.input


invert_colors : Icon msg
invert_colors =
    makeIcon Action.invert_colors


label : Icon msg
label =
    makeIcon Action.label


label_outline : Icon msg
label_outline =
    makeIcon Action.label_outline


language : Icon msg
language =
    makeIcon Action.language


launch : Icon msg
launch =
    makeIcon Action.launch


lightbulb_outline : Icon msg
lightbulb_outline =
    makeIcon Action.lightbulb_outline


line_style : Icon msg
line_style =
    makeIcon Action.line_style


line_weight : Icon msg
line_weight =
    makeIcon Action.line_weight


list : Icon msg
list =
    makeIcon Action.list


lock : Icon msg
lock =
    makeIcon Action.lock


lock_open : Icon msg
lock_open =
    makeIcon Action.lock_open


lock_outline : Icon msg
lock_outline =
    makeIcon Action.lock_outline


loyalty : Icon msg
loyalty =
    makeIcon Action.loyalty


markunread_mailbox : Icon msg
markunread_mailbox =
    makeIcon Action.markunread_mailbox


motorcycle : Icon msg
motorcycle =
    makeIcon Action.motorcycle


note_add : Icon msg
note_add =
    makeIcon Action.note_add


offline_pin : Icon msg
offline_pin =
    makeIcon Action.offline_pin


opacity : Icon msg
opacity =
    makeIcon Action.opacity


open_in_browser : Icon msg
open_in_browser =
    makeIcon Action.open_in_browser


open_in_new : Icon msg
open_in_new =
    makeIcon Action.open_in_new


open_with : Icon msg
open_with =
    makeIcon Action.open_with


pageview : Icon msg
pageview =
    makeIcon Action.pageview


pan_tool : Icon msg
pan_tool =
    makeIcon Action.pan_tool


payment : Icon msg
payment =
    makeIcon Action.payment


perm_camera_mic : Icon msg
perm_camera_mic =
    makeIcon Action.perm_camera_mic


perm_contact_calendar : Icon msg
perm_contact_calendar =
    makeIcon Action.perm_contact_calendar


perm_data_setting : Icon msg
perm_data_setting =
    makeIcon Action.perm_data_setting


perm_device_information : Icon msg
perm_device_information =
    makeIcon Action.perm_device_information


perm_identity : Icon msg
perm_identity =
    makeIcon Action.perm_identity


perm_media : Icon msg
perm_media =
    makeIcon Action.perm_media


perm_phone_msg : Icon msg
perm_phone_msg =
    makeIcon Action.perm_phone_msg


perm_scan_wifi : Icon msg
perm_scan_wifi =
    makeIcon Action.perm_scan_wifi


pets : Icon msg
pets =
    makeIcon Action.pets


picture_in_picture : Icon msg
picture_in_picture =
    makeIcon Action.picture_in_picture


picture_in_picture_alt : Icon msg
picture_in_picture_alt =
    makeIcon Action.picture_in_picture_alt


play_for_work : Icon msg
play_for_work =
    makeIcon Action.play_for_work


polymer : Icon msg
polymer =
    makeIcon Action.polymer


power_settings_new : Icon msg
power_settings_new =
    makeIcon Action.power_settings_new


pregnant_woman : Icon msg
pregnant_woman =
    makeIcon Action.pregnant_woman


print : Icon msg
print =
    makeIcon Action.print


query_builder : Icon msg
query_builder =
    makeIcon Action.query_builder


question_answer : Icon msg
question_answer =
    makeIcon Action.question_answer


receipt : Icon msg
receipt =
    makeIcon Action.receipt


record_voice_over : Icon msg
record_voice_over =
    makeIcon Action.record_voice_over


redeem : Icon msg
redeem =
    makeIcon Action.redeem


remove_shopping_cart : Icon msg
remove_shopping_cart =
    makeIcon Action.remove_shopping_cart


reorder : Icon msg
reorder =
    makeIcon Action.reorder


report_problem : Icon msg
report_problem =
    makeIcon Action.report_problem


restore : Icon msg
restore =
    makeIcon Action.restore


restore_page : Icon msg
restore_page =
    makeIcon Action.restore_page


room : Icon msg
room =
    makeIcon Action.room


rounded_corner : Icon msg
rounded_corner =
    makeIcon Action.rounded_corner


rowing : Icon msg
rowing =
    makeIcon Action.rowing


schedule : Icon msg
schedule =
    makeIcon Action.schedule


search : Icon msg
search =
    makeIcon Action.search


settings : Icon msg
settings =
    makeIcon Action.settings


settings_application : Icon msg
settings_application =
    makeIcon Action.settings_application


settings_backup_restore : Icon msg
settings_backup_restore =
    makeIcon Action.settings_backup_restore


settings_bluetooth : Icon msg
settings_bluetooth =
    makeIcon Action.settings_bluetooth


settings_brightness : Icon msg
settings_brightness =
    makeIcon Action.settings_brightness


settings_cell : Icon msg
settings_cell =
    makeIcon Action.settings_cell


settings_ethernet : Icon msg
settings_ethernet =
    makeIcon Action.settings_ethernet


settings_input_antenna : Icon msg
settings_input_antenna =
    makeIcon Action.settings_input_antenna


settings_input_component : Icon msg
settings_input_component =
    makeIcon Action.settings_input_component


settings_input_composite : Icon msg
settings_input_composite =
    makeIcon Action.settings_input_composite


settings_input_hdmi : Icon msg
settings_input_hdmi =
    makeIcon Action.settings_input_hdmi


settings_input_svideo : Icon msg
settings_input_svideo =
    makeIcon Action.settings_input_svideo


settings_overscan : Icon msg
settings_overscan =
    makeIcon Action.settings_overscan


settings_phone : Icon msg
settings_phone =
    makeIcon Action.settings_phone


settings_power : Icon msg
settings_power =
    makeIcon Action.settings_power


settings_remote : Icon msg
settings_remote =
    makeIcon Action.settings_remote


settings_voice : Icon msg
settings_voice =
    makeIcon Action.settings_voice


shop : Icon msg
shop =
    makeIcon Action.shop


shop_two : Icon msg
shop_two =
    makeIcon Action.shop_two


shopping_basket : Icon msg
shopping_basket =
    makeIcon Action.shopping_basket


shopping_cart : Icon msg
shopping_cart =
    makeIcon Action.shopping_cart


speaker_notes : Icon msg
speaker_notes =
    makeIcon Action.speaker_notes


speaker_notes_off : Icon msg
speaker_notes_off =
    makeIcon Action.speaker_notes_off


spellcheck : Icon msg
spellcheck =
    makeIcon Action.spellcheck


star_rate : Icon msg
star_rate =
    makeIcon Action.star_rate


stars : Icon msg
stars =
    makeIcon Action.stars


store : Icon msg
store =
    makeIcon Action.store


subject : Icon msg
subject =
    makeIcon Action.subject


supervisor_account : Icon msg
supervisor_account =
    makeIcon Action.supervisor_account


swap_horiz : Icon msg
swap_horiz =
    makeIcon Action.swap_horiz


swap_vert : Icon msg
swap_vert =
    makeIcon Action.swap_vert


swap_vertical_circle : Icon msg
swap_vertical_circle =
    makeIcon Action.swap_vertical_circle


system_update_alt : Icon msg
system_update_alt =
    makeIcon Action.system_update_alt


tab : Icon msg
tab =
    makeIcon Action.tab


tab_unselected : Icon msg
tab_unselected =
    makeIcon Action.tab_unselected


theaters : Icon msg
theaters =
    makeIcon Action.theaters


three_d_rotation : Icon msg
three_d_rotation =
    makeIcon Action.three_d_rotation


thumb_down : Icon msg
thumb_down =
    makeIcon Action.thumb_down


thumb_up : Icon msg
thumb_up =
    makeIcon Action.thumb_up


thumbs_up_down : Icon msg
thumbs_up_down =
    makeIcon Action.thumbs_up_down


timeline : Icon msg
timeline =
    makeIcon Action.timeline


toc : Icon msg
toc =
    makeIcon Action.toc


today : Icon msg
today =
    makeIcon Action.today


toll : Icon msg
toll =
    makeIcon Action.toll


touch_app : Icon msg
touch_app =
    makeIcon Action.touch_app


track_changes : Icon msg
track_changes =
    makeIcon Action.track_changes


translate : Icon msg
translate =
    makeIcon Action.translate


trending_down : Icon msg
trending_down =
    makeIcon Action.trending_down


trending_flat : Icon msg
trending_flat =
    makeIcon Action.trending_flat


trending_up : Icon msg
trending_up =
    makeIcon Action.trending_up


turned_in : Icon msg
turned_in =
    makeIcon Action.turned_in


turned_in_not : Icon msg
turned_in_not =
    makeIcon Action.turned_in_not


update : Icon msg
update =
    makeIcon Action.update


verified_user : Icon msg
verified_user =
    makeIcon Action.verified_user


view_agenda : Icon msg
view_agenda =
    makeIcon Action.view_agenda


view_array : Icon msg
view_array =
    makeIcon Action.view_array


view_carousel : Icon msg
view_carousel =
    makeIcon Action.view_carousel


view_column : Icon msg
view_column =
    makeIcon Action.view_column


view_day : Icon msg
view_day =
    makeIcon Action.view_day


view_headline : Icon msg
view_headline =
    makeIcon Action.view_headline


view_list : Icon msg
view_list =
    makeIcon Action.view_list


view_module : Icon msg
view_module =
    makeIcon Action.view_module


view_quilt : Icon msg
view_quilt =
    makeIcon Action.view_quilt


view_stream : Icon msg
view_stream =
    makeIcon Action.view_stream


view_week : Icon msg
view_week =
    makeIcon Action.view_week


visibility : Icon msg
visibility =
    makeIcon Action.visibility


visibility_off : Icon msg
visibility_off =
    makeIcon Action.visibility_off


watch_later : Icon msg
watch_later =
    makeIcon Action.watch_later


work : Icon msg
work =
    makeIcon Action.work


youtube_searched_for : Icon msg
youtube_searched_for =
    makeIcon Action.youtube_searched_for


zoom_in : Icon msg
zoom_in =
    makeIcon Action.zoom_in


zoom_out : Icon msg
zoom_out =
    makeIcon Action.zoom_out
