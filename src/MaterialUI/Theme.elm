module MaterialUI.Theme exposing
    ( Color(..)
    , ColorTheme
    , Shape(..)
    , ShapeSchema
    , Size(..)
    , Theme
    , addAlpha
    , applyCase
    , defaultTheme
    , fontToAttributes
    , getColor
    , getOnColor
    , onColor
    , shapeToAttributes
    , toElementColor
    )

import Color
import Element exposing (Attribute, Element)
import Element.Background
import Element.Border
import Element.Font
import MaterialColor


toElementColor : Color.Color -> Element.Color
toElementColor color =
    Color.toRgba color
        |> Element.fromRgb


addAlpha : Float -> Element.Color -> Element.Color
addAlpha value color =
    let
        rgb =
            Element.toRgb color
    in
    Element.fromRgb
        { rgb | alpha = value }


type alias Theme a =
    { color : ColorTheme a
    , shape : ShapeSchema
    , typescale : Typescale
    }


type Color a
    = Primary
    | OnPrimary
    | PrimaryVariant
    | OnPrimaryVariant
    | Secondary
    | OnSecondary
    | SecondaryVariant
    | OnSecondaryVariant
    | Background
    | OnBackground
    | Surface
    | OnSurface
    | Error
    | OnError
    | Alternative a


type alias ColorTheme a =
    { isDark : Bool
    , primary : Element.Color
    , primaryVariant : Element.Color
    , secondary : Element.Color
    , secondaryVariant : Element.Color
    , background : Element.Color
    , surface : Element.Color
    , error : Element.Color
    , onPrimary : Element.Color
    , onPrimaryVariant : Element.Color
    , onSecondary : Element.Color
    , onSecondaryVariant : Element.Color
    , onBackground : Element.Color
    , onSurface : Element.Color
    , onError : Element.Color
    , alternative : List ( a, Element.Color )
    }


onColor : Color a -> Color a
onColor key =
    case key of
        Primary ->
            OnPrimary

        PrimaryVariant ->
            OnPrimaryVariant

        OnPrimary ->
            Primary

        OnPrimaryVariant ->
            PrimaryVariant

        Secondary ->
            OnSecondary

        SecondaryVariant ->
            OnSecondaryVariant

        OnSecondary ->
            Secondary

        OnSecondaryVariant ->
            SecondaryVariant

        Background ->
            OnBackground

        OnBackground ->
            Background

        Surface ->
            OnSurface

        OnSurface ->
            Surface

        Error ->
            OnError

        OnError ->
            Error

        Alternative a ->
            Alternative a



-- TODO Alternative colors should always provide a "on" color


getColor : Color a -> Theme a -> Element.Color
getColor key { color } =
    case key of
        Primary ->
            color.primary

        PrimaryVariant ->
            color.primaryVariant

        OnPrimary ->
            color.onPrimary

        OnPrimaryVariant ->
            color.onPrimaryVariant

        Secondary ->
            color.secondary

        SecondaryVariant ->
            color.secondaryVariant

        OnSecondary ->
            color.onSecondary

        OnSecondaryVariant ->
            color.onSecondaryVariant

        Background ->
            color.background

        OnBackground ->
            color.onBackground

        Surface ->
            color.surface

        OnSurface ->
            color.onSurface

        Error ->
            color.error

        OnError ->
            color.onError

        Alternative a ->
            List.filterMap
                (\( akey, ecolor ) ->
                    if akey == a then
                        Just ecolor

                    else
                        Nothing
                )
                color.alternative
                |> List.head
                |> Maybe.withDefault color.primary


getOnColor : Color a -> Theme a -> Element.Color
getOnColor =
    onColor >> getColor


type Size
    = Dp Int
    | Ratio Float


sizeToPixels : Int -> Int -> Size -> Int
sizeToPixels width height size =
    case size of
        Dp value ->
            value

        Ratio ratio ->
            round <|
                toFloat (min width height)
                    * ratio


type Shape
    = Rounded Size Size Size Size


shapeToAttributes : Int -> Int -> Shape -> List (Attribute msg)
shapeToAttributes width height (Rounded topLeft topRight bottomRight bottomLeft) =
    let
        toPixels =
            sizeToPixels width height

        corners =
            { topLeft = toPixels topLeft
            , topRight = toPixels topRight
            , bottomRight = toPixels bottomRight
            , bottomLeft = toPixels bottomLeft
            }
    in
    [ Element.Border.roundEach corners
    ]


type alias ShapeSchema =
    { button : Shape
    , card : Shape
    , textField :
        { filled : Shape
        , outlined : Shape
        }
    }


shapeRoundedDpEach : Int -> Int -> Int -> Int -> Shape
shapeRoundedDpEach topLeft topRight bottomRight bottomLeft =
    Rounded (Dp topLeft) (Dp topRight) (Dp bottomRight) (Dp bottomLeft)


shapeRoundedDp : Int -> Shape
shapeRoundedDp size =
    shapeRoundedDpEach size size size size


type FontCase
    = Sentence
    | AllCaps


type FontWeight
    = Heavy
    | ExtraBold
    | Bold
    | SemiBold
    | Medium
    | Regular
    | Light
    | ExtraLight
    | Hairline


type alias Font =
    { typeface : List Element.Font.Font
    , weight : FontWeight
    , size : Int
    , fontcase : FontCase
    , letterSpacing : Float
    }


fontWeightToAttribute : FontWeight -> Element.Attribute msg
fontWeightToAttribute fw =
    case fw of
        Heavy ->
            Element.Font.heavy

        ExtraBold ->
            Element.Font.extraBold

        Bold ->
            Element.Font.bold

        SemiBold ->
            Element.Font.semiBold

        Medium ->
            Element.Font.medium

        Regular ->
            Element.Font.regular

        Light ->
            Element.Font.light

        ExtraLight ->
            Element.Font.extraLight

        Hairline ->
            Element.Font.hairline


fontToAttributes : Font -> List (Element.Attribute msg)
fontToAttributes font =
    [ Element.Font.family font.typeface
    , fontWeightToAttribute font.weight
    , Element.Font.size font.size
    , Element.Font.letterSpacing font.letterSpacing
    ]


applyCase : FontCase -> String -> String
applyCase fontcase text =
    case fontcase of
        Sentence ->
            String.toUpper (String.left 1 text)
                ++ String.dropLeft 1 text

        AllCaps ->
            String.toUpper text


type alias Typescale =
    { h1 : Font
    , h2 : Font
    , h3 : Font
    , h4 : Font
    , h5 : Font
    , h6 : Font
    , subtitle1 : Font
    , subtitle2 : Font
    , body1 : Font
    , body2 : Font
    , button : Font
    , caption : Font
    , overline : Font
    }


defaultTheme : Theme a
defaultTheme =
    { color =
        { isDark = False
        , primary = Element.rgb255 98 0 238 -- #6200EE
        , primaryVariant = Element.rgb255 54 0 179
        , secondary = Element.rgb255 3 218 198 -- #03DAC6
        , secondaryVariant = Element.rgb255 1 135 134 -- #018786
        , background = toElementColor Color.white
        , surface = toElementColor Color.white
        , error = Element.rgb255 176 0 32 -- #B00020
        , onPrimary = toElementColor Color.white
        , onPrimaryVariant = toElementColor Color.white
        , onSecondary = toElementColor Color.black
        , onSecondaryVariant = toElementColor Color.white
        , onBackground = toElementColor Color.black
        , onSurface = toElementColor Color.black
        , onError = toElementColor Color.white
        , alternative = []
        }
    , shape =
        { button = shapeRoundedDp 4
        , card = shapeRoundedDp 4
        , textField =
            { filled = shapeRoundedDpEach 4 4 0 0
            , outlined = shapeRoundedDp 4
            }
        }
    , typescale = defaultTypescale
    }


defaultTypescale : Typescale
defaultTypescale =
    { h1 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Light
        , size = 96
        , fontcase = Sentence
        , letterSpacing = -1.5
        }
    , h2 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Light
        , size = 60
        , fontcase = Sentence
        , letterSpacing = -0.5
        }
    , h3 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 48
        , fontcase = Sentence
        , letterSpacing = 0
        }
    , h4 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 34
        , fontcase = Sentence
        , letterSpacing = 0.25
        }
    , h5 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 24
        , fontcase = Sentence
        , letterSpacing = 0
        }
    , h6 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Medium
        , size = 20
        , fontcase = Sentence
        , letterSpacing = 0.15
        }
    , subtitle1 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 16
        , fontcase = Sentence
        , letterSpacing = 0.15
        }
    , subtitle2 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Medium
        , size = 14
        , fontcase = Sentence
        , letterSpacing = 0.1
        }
    , body1 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 16
        , fontcase = Sentence
        , letterSpacing = 0.5
        }
    , body2 =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 14
        , fontcase = Sentence
        , letterSpacing = 0.25
        }
    , button =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Medium
        , size = 14
        , fontcase = AllCaps
        , letterSpacing = 1.25
        }
    , caption =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 12
        , fontcase = Sentence
        , letterSpacing = 0.4
        }
    , overline =
        { typeface = [ Element.Font.typeface "Roboto" ]
        , weight = Regular
        , size = 10
        , fontcase = AllCaps
        , letterSpacing = 1.5
        }
    }
