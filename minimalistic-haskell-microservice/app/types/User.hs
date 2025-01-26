{-# LANGUAGE DeriveGeneric #-}
module Types.User where

import Prelude
import Control.Applicative
import Data.Aeson hiding ((.:))
import GHC.Generics (Generic)
import Data.ByteString.Lazy.Char8 (pack)
import Data.Csv hiding (defaultOptions)
import Control.Monad
import qualified Data.ByteString.Char8 as BS  -- Import strict ByteString


data GetAllUserResponse = GetAllUserResponse 
    {
        firstname:: String,
        lastname :: String
        -- email :: String,
        -- birthDate :: String,
        -- id:: Int
    }deriving(Show, Generic)

-- instance FromRecord GetAllUserResponse where
--     parseRecord GetAllUserResponse
--         | length GetAllUserResponse == 2 = GetAllUserResponse <$> GetAllUserResponse .! 0 <*> GetAllUserResponse .! 1
--         | otherwise = mzero

-- instance FromNamedRecord GetAllUserResponse where
--     parseNamedRecord GetAllUserResponse = GetAllUserResponse
--         <$> GetAllUserResponse .: (BS.pack "firstname")
--         <*> GetAllUserResponse .: (BS.pack "lastname")

instance FromJSON GetAllUserResponse where
    parseJSON = genericParseJSON defaultOptions

instance ToJSON GetAllUserResponse where
    toJSON = genericToJSON defaultOptions

