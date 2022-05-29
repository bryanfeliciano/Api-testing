{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Text (Text)
import Network.Wreq
import GHC.Generics
import Data.Aeson



data TranslateRequest = TranslateRequest {
  q :: Text,
  source :: Text,
  target :: Text,
  format :: Text
} deriving (Show,Generic)

instance toJson TranslateRequest

main :: IO ()
main = do
  rsp <- post "https://libretranslate.com/languages" (toJson (TranslateRequest {
  q :: _,
  source :: _,
  target :: _,
  format :: _
  })
  putStrLn rsp
