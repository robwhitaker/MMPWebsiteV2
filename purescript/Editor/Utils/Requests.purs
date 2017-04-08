module Editor.Utils.Requests where

import Editor.Models.Chapter (Chapter)
  
import Prelude
import Data.Argonaut.Core (Json)
import Data.Maybe (Maybe(..), maybe)
import Data.Either (Either)
import Data.Foreign (unsafeFromForeign, writeObject)
import Data.Foreign.Class (class AsForeign, class IsForeign, read, write, (.=))
import Data.Foreign.Null (writeNull)
import Control.Monad.Except (runExcept, withExcept)
import Network.HTTP.Affjax (Affjax, URL, get, post)

---- REQUESTS ----

getChapters :: forall e. Affjax e (Either String (Array Chapter))
getChapters = getRequest chaptersEndpoint

postChapters :: forall e. String -> Affjax e (Either String (Array Chapter))
postChapters secretKey = postRequest chaptersEndpoint secretKey (Nothing :: Maybe String)

---- REQUEST HELPERS ----

getRequest :: forall e r. (IsForeign r) => URL -> Affjax e (Either String r)
getRequest endpoint = do
    affjaxResponse <- get endpoint
    pure $ affjaxResponse { response = runExcept $ withExcept show $ read affjaxResponse.response }

postRequest :: forall a e r. (AsForeign a, IsForeign r) => URL -> String -> Maybe a -> Affjax e (Either String r)
postRequest endpoint secretKey postData = do
    affjaxResponse <- post endpoint (unsafeFromForeign payload :: Json)
    pure $ affjaxResponse { response = runExcept $ withExcept show $ read affjaxResponse.response }
  where 
    payload = writeObject
        [ "secretKey" .= secretKey
        , "data" .= maybe writeNull write postData
        ]

---- ENDPOINTS ----

apiBase :: String
apiBase = "/api"

-- supports GET and POST
chaptersEndpoint :: String
chaptersEndpoint = apiBase <> "/chapters"

-- supports POST
chapterUpdateEndpoint :: String
chapterUpdateEndpoint = chaptersEndpoint <> "/crupdate"

-- supports POST
chapterDeleteEndpoint :: String
chapterDeleteEndpoint = chaptersEndpoint <> "/delete"

-- supports GET
singleChapterEndpoint :: Int -> String
singleChapterEndpoint cId = chaptersEndpoint <> "/" <> show cId

-- supports GET
nextReleaseEndpoint :: String
nextReleaseEndpoint = apiBase <> "/next"

