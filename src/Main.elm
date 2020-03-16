module Main exposing (main)

import Browser
import Html exposing (..)



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { name : String }


init : () -> (Model, Cmd Msg)
init _ =
    ( Model "Hello World!!"
    , Cmd.none
    )



-- UPDATE


type Msg
    = Msg


update : Msg -> Model -> (Model, Cmd Msg)
update _ model =
    ( model
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.name ] ]
