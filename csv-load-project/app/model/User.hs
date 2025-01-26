{-# LANGUAGE DeriveGeneric #-}

module Model.User where

import Prelude
import Control.Applicative
import Data.Aeson hiding ((.:))
import GHC.Generics (Generic)
import Data.ByteString.Lazy.Char8 (pack)
import Data.Csv hiding (defaultOptions)
import Control.Monad
import qualified Data.ByteString.Char8 as BS  -- Import strict ByteString


data User = User 
    {
        name:: String,
        id:: Int
    }deriving(Show, Generic)

instance FromRecord User where
    parseRecord user
        | length user == 2 = User <$> user .! 0 <*> user .! 1
        | otherwise = mzero

instance FromNamedRecord User where
    parseNamedRecord user = User
        <$> user .: (BS.pack "Name")
        <*> user .: (BS.pack "Id")

instance FromJSON User where
    parseJSON = genericParseJSON defaultOptions

instance ToJSON User where
    toJSON = genericToJSON defaultOptions