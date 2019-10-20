module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import Landing.Root (mkLandingRoot)
import React.Basic.DOM (render)
import React.Basic.Hooks (element)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

-- todoApp <- mkTodoApp
--       let app = element todoApp {}
--       render app c


main :: Effect Unit
main = do
  container <- getElementById "app" =<< (map toNonElementParentNode $ document =<< window)
  case container of
    Nothing -> throw "Container element not found."
    Just c  -> do
      landingRoot <- mkLandingRoot
      let app = element landingRoot { }
      render app c