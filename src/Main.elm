module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Navbar as Navbar



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
    { name : String
    , navState : Navbar.State
    }


init : () -> (Model, Cmd Msg)
init _ =
    let
        name =
            "Hello World!!"

        ( navState, navCmd ) =
            Navbar.initialState NavMsg
    in
    ( Model name navState
    , navCmd
    )



-- UPDATE


type Msg
    = NavMsg Navbar.State


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NavMsg state ->
            ( { model | navState = state }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navState NavMsg



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "main" ]
        [ CDN.stylesheet
        , div
            [ class "fixed-top"
            , class "header"
            ]
            [ text "チャット"
            ]
        , div
            [ class "fixed-top"
            , class "message-area-wrap"
            ]
            [ div
                [ class "message-area" ]
                [ div
                    [ class "receive-message" ]
                    [ text "test" ]
                , div
                    [ class "send-message" ]
                    [ text "test" ]
                ]
            ]
        , div
            [ class "fixed-bottom"
            , class "message-bar"
            ]
            [ input [ placeholder "Message", value "" ] []
            ]
        ]
