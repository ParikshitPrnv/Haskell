module Main where

import Model.User()
-- import Network.Conduit
import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy.Char8 as L8
import qualified Configuration.Constants as Constants
import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)
import Servant


dummyGoogleCall :: IO ()
dummyGoogleCall = do
    manager <- newManager tlsManagerSettings
    request <- parseRequest (Constants.dummyEndPoint)
    response <- httpLbs request  manager
    L8.putStrLn (responseBody response)

type APIs = "hello" :> "world" :> Get '[JSON] World

sever :: Server APIs
server = APIs

data World = World {
    response :: String
}

app :: Application
app = serve (Proxy :: Proxy APIs) server

main :: IO ()
main = do
    putStrLn "Rom Rom Bhaiyo!"
    run 8080 app


{- To DOs
1. Mapping of headers to object
2. Handle the scnarios where header is not present
-}