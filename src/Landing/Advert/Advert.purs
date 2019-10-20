module Landing.Advert where

import Prelude

import Effect (Effect)
import Landing.Advert.Header (mkHeader)
import React.Basic.DOM as R
import React.Basic.Hooks (ReactComponent, component, element, memo)

type Props = {}

mkAdvert :: Effect (ReactComponent {})
mkAdvert = do
    header <- memo mkHeader
    component "Advert" \_ -> do
        pure $ 
            R.div {   
                className: "advert",
                children: [
                    R.div{
                        className: "content",
                        children: [
                            element header {}
                        ]    
                    }
                ]
            }   

            