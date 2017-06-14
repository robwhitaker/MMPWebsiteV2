module Editor.Main where

import Prelude
import Data.Either
import Editor.Models.Chapter as Chapter
import Halogen.Aff as HA
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Now (NOW)
import Control.Monad.Except (runExcept)
import Data.Array (length)
import Data.Foreign (Foreign, ForeignError(..))
import Data.JSDate (LOCALE)
import Data.List.NonEmpty (NonEmptyList(..))
import Editor.Components.ChapterList (chapterList)
import Editor.Components.Editor (editor)
import Editor.Models.Chapter (Chapter(..))
import Editor.Utils.GoogleServices (GAPI)
import Editor.Utils.Requests (getChapters, postChapters)
import Halogen (liftAff)
import Halogen.VDom.Driver (runUI)
import Network.HTTP.Affjax (AJAX)

main :: Eff (HA.HalogenEffects (console :: CONSOLE, ajax :: AJAX, locale :: LOCALE, gapi :: GAPI, now :: NOW)) Unit
main = HA.runHalogenAff do
    body <- HA.awaitBody
    runUI editor unit body 
  