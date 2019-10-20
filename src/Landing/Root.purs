module Landing.Root where

import Prelude

import Effect (Effect)
import Landing.Advert (mkAdvert)
import React.Basic (fragment)
import React.Basic.Hooks (ReactComponent, component, element, memo)

type Props = { }

mkLandingRoot :: Effect (ReactComponent {})
mkLandingRoot = do
    advert <- memo mkAdvert
    component "Landing" \_ -> do
        pure $ 
            fragment [
                element advert {}
            ]
            

  