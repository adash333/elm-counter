module Main exposing (main)

import Browser
import Html exposing (Html, a, br, button, div, h1, i, img, span, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



---- UPDATE ----


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Elm Counter Bulma" ]
        , img [ src "/logo.svg" ] []
        , br [] []
        , button [ class "button is-info", onClick Decrement ]
            [ span [ class "icon" ]
                [ i [ class "fas fa-minus-circle" ] [] ]
            , span [] [ text "minus" ]
            ]
        , div [ class "button is-success is-outlined" ] [ text (String.fromInt model) ]
        , button [ class "button is-danger", onClick Increment ]
            [ span [ class "icon" ]
                [ i [ class "fas fa-plus-circle" ] [] ]
            , span [] [ text "plus" ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
