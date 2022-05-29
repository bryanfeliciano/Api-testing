{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Text (Text)
import qualified Data.Text.IO as T
import Network.Wreq
import GHC.Generics
import Data.Aeson
import Control.Lens



data TranslateRequest = TranslateRequest {
  q :: Text,
  source :: Text,
  target :: Text,
  format :: Text
} deriving (Show,Generic)

instance toJson TranslateRequest

data TranslateResponse = TranslateResponse {
  translatedText :: Text
} deriving (Show,Generic)

instance fromJson TranslateResponse

main :: IO ()
main = do
  rsp <- asJson =<< post "https://libretranslate.com/languages" (toJson (TranslateRequest {
  q :: "This is a haskell test",
  source :: "en",
  target :: "es",
  format :: "text"
  })
  print (translatedText (rsp ^. responseBody))
