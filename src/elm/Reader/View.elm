module Reader.View exposing (extras, follow, footerContent, footerHeadings, mkFooterSection, share, view)

import Core.Utils.SelectionList as SL
import DateFormat
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Markdown
import Reader.Components.Modal.Messages as Modal
import Reader.Components.Modal.View as Modal
import Reader.Messages exposing (..)
import Reader.Model exposing (..)
import Reader.Ports exposing (..)
import Reader.Utils as Utils
import Reader.Views.Dropdown as Dropdown
import Reader.Views.ShareButtons as ShareButtons
import String


view : Model -> Html Msg
view model =
    let
        isLastPage =
            --NOTE: Logic copied from Update.elm. Maybe make a helper function?
            model.pages.current
                + 1
                >= model.pages.total
                && SL.traverseFromSelectedUntil
                    SL.next
                    (\entry -> Utils.isOwnRelease entry && entry.chapter /= model.toc.selected.chapter)
                    model.toc
                == Nothing
    in
    div []
        [ section
            [ class "reader" ]
            [ div [ class "banner" ] [ a [ href "/" ] [ div [ class "banner-logo" ] [] ] ]
            , div
                ([ class "book" ]
                    ++ (case model.bookDimensions of
                            Just ( width, height ) ->
                                [ style "height" <| String.fromFloat height ++ "px"
                                , style "width" <| String.fromFloat width ++ "px"
                                ]

                            Nothing ->
                                [ style "height" "80vh", style "width" "68.5vh" ]
                       )
                )
                [ div [ class "drop-shadow" ] []
                , div
                    --COVER LAYER
                    [ classList
                        [ ( "loader cover", True )
                        , ( "isDisplayed", model.showCover )
                        ]
                    , onClick CoverOpen
                    ]
                    [ div
                        [ class "glow" ]
                        [ div
                            [ class "cover-txt cover-btn" ]
                            [ text <|
                                case model.bookmark of
                                    HasBookmark ->
                                        "{{% reader.book.continue %}}"

                                    NoBookmark ->
                                        "{{% reader.book.start %}}"

                                    LoadingBookmark ->
                                        "{{% reader.book.loading %}}"
                            ]
                        , if model.bookmark == NoBookmark then
                            div
                                [ class "cover-txt start-reading-txt" ]
                                [ text "{{% reader.book.helperPrompt %}}" ]

                          else
                            div [] []
                        ]
                    ]
                , div
                    --LOADER LAYER
                    [ classList
                        [ ( "loader", True )
                        , ( "isDisplayed", not model.showCover && (model.state == Rendering || model.state == Loading || model.state == Reflowing) )
                        ]
                    ]
                    [ case model.state of
                        Loading ->
                            div [ class "loading-label" ] [ text "Loading..." ]

                        Rendering ->
                            div [ class "loading-label" ] [ text "Rendering..." ]

                        Reflowing ->
                            div [ class "loading-label" ] [ text "Reflowing..." ]

                        _ ->
                            text ""
                    , div [ class "loading-label" ] [ img [ src "/static/img/ajax-loader-2.gif" ] [] ]
                    ]
                , div [ class "book-back" ]
                    [ div
                        [ classList [ ( "book-inner", True ), ( "hidden", model.state == Rendering || model.state == Loading || model.state == Reflowing ) ] ]
                        [ div
                            [ class "top-bar" ]
                            [ Html.map Dropdown <| Dropdown.view model.toc model.tocExpanded ]

                        -- TODO: Removed "seamless" attribute as it's no longer supported; might need to replace with CSS or something.
                        , iframe [ id "book-text-frame", src "/renderer.html" ] []
                        , div
                            [ class "bottom-bar" ]
                            [ div
                                [ class "book-arrow back-btn", onClick (TurnPage Backward) ]
                                [ i [ class "fa fa-angle-left" ] []
                                ]
                            , div [ class "page-num" ] [ text <| String.fromInt (model.pages.current + 1) ] --++ " / " ++ toString model.pages.total ]
                            , div
                                [ classList [ ( "book-arrow forward-btn", True ), ( "btn-disabled", isLastPage ) ], onClick (TurnPage Forward) ]
                                [ div [ class "last-page-txt" ] <|
                                    case model.nextReleaseDate of
                                        Just date ->
                                            [ text "{{% reader.book.nextRelease %}}"
                                            , br [] []
                                            , text <|
                                                DateFormat.format
                                                    [ DateFormat.dayOfWeekNameFull
                                                    , DateFormat.text " "
                                                    , DateFormat.monthFixed
                                                    , DateFormat.text "/"
                                                    , DateFormat.dayOfMonthFixed
                                                    , DateFormat.text "/"
                                                    , DateFormat.yearNumber
                                                    ]
                                                    model.userTimezone
                                                    date
                                            ]

                                        Nothing ->
                                            [ text <| "{{% reader.book.noReleaseScheduled %}}" ]
                                , i [ class "fa fa-angle-right" ] []
                                ]
                            ]
                        ]
                    ]
                ]
            , Html.map ShareDialogMsg <| Modal.view model.shareDialog
            ]
        , section
            [ classList [ ( "comments", True ), ( "no-display", model.showCover ) ] ]
            [ div
                [ id "authors-note", classList [ ( "no-display", model.toc.selected.authorsNote == "" ) ] ]
                [ h2 [ class "fancy-heading no-bottom-margin" ] [ text "Author's Note" ]
                , div [ class "byline" ] [ span [ class "highlight-color" ] [ text <| Utils.selectedTitleFromSL model.toc ] ]
                , div [ class "authors-note-text" ] [ Markdown.toHtml [] model.toc.selected.authorsNote ]
                ]
            , div
                [ id "comments-box" ]
                [ h2 [ class "fancy-heading" ] [ text "Discussion for ", span [ class "highlight-color" ] [ text <| Utils.selectedTitleFromSL model.toc ] ]
                , div [ id "disqus_thread" ] []
                ]
            ]
        , footer []
            [ div [ class "footer-link-block" ] <| List.map2 mkFooterSection footerHeadings footerContent
            , div [ class "copy" ] [ Markdown.toHtml [] "{{% reader.metadata.copy %}}" ]
            ]
        , Html.map CreditsRollMsg <| Modal.view model.creditsRoll
        , Html.map ContactModalMsg <| Modal.view model.contactModal
        ]


mkFooterSection : String -> Html Msg -> Html Msg
mkFooterSection heading content =
    div [ class "link-section" ]
        [ h2 [ class "fancy-heading" ] [ text heading ]
        , content
        ]


footerHeadings =
    [ "Follow", "Share", "Extras" ]


footerContent =
    [ follow, share, extras ]


follow =
    let
        mkIcon ( iconUrl, dest ) =
            a [ href dest, target "_BLANK" ]
                [ img [ src <| "/static/img/" ++ iconUrl ] [] ]

        icons =
            [ ( "facebook-icon.png", "https://www.facebook.com/{{% social.facebook %}}" )
            , ( "twitter-icon.png", "https://twitter.com/{{% social.twitter %}}" )
            , ( "ello-icon.jpg", "https://ello.co/{{% social.ello %}}" )
            , ( "rss-icon.png", "/rss" )
            ]

        prependIcons =
            (++) (List.map mkIcon icons)
    in
    div [] (prependIcons [ iframe [ src "mailchimp-signup.html", id "mailchimp-signup" ] [] ])


share =
    Html.map OpenSharePopup <|
        div
            []
            [ ShareButtons.facebook
            , ShareButtons.twitter
            , ShareButtons.tumblr
            , ShareButtons.gplus
            , ShareButtons.reddit
            ]


extras =
    ul [] <|
        List.map (li [] << (\a -> (::) a []))
            [ a [ onClick (ContactModalMsg Modal.ShowModal) ] [ text "Contact Me" ]
            , a [ onClick (CreditsRollMsg Modal.ShowModal) ] [ text "Credits" ]
            ]
