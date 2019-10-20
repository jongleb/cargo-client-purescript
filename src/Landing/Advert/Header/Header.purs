module Landing.Advert.Header where

import Prelude

import CSS (fontFamily, fontSize)
import Effect (Effect)
import React.Basic.DOM as R
import React.Basic.Emotion as E
import React.Basic.Hooks (ReactComponent, component)
import Web.HTML.HTMLElement (className)

foreign import logo :: String

headStyle :: E.Style
headStyle = E.css 
    {   position: E.str "absolute"
    ,   left: E.str "50%"
    ,   width: E.str "970px"
    ,   marginTop: E.str "30px"
    }

wrapStyle :: E.Style
wrapStyle = E.css 
    {   position: E.str "relative"
    ,   left: E.str "-50%"
    }

navigationStyle :: E.Style
navigationStyle = E.css
    {
        display: E.str "flex"
    }  

menuStyle :: E.Style
menuStyle = E.css
    {
        marginLeft: E.str "40px",
        marginTop: E.str "25px",
        color: E.str "#fff",
        fontSize: E.str "18px",
        fontFamily: E.str "Arial"
    }    

type Props = {}


mkHeader :: Effect (ReactComponent {})
mkHeader = do
    component "Header" \_ -> do
        pure 
            $ E.element R.div'
            { css: headStyle
            , className: mempty      
            , children: [
                E.element R.div'{
                    css: wrapStyle,
                    className: mempty,
                    children: [
                        E.element R.div'{
                            css: navigationStyle,
                            className: mempty,
                            children: [
                                R.img {
                                    src: logo
                                },
                                E.element R.div'{
                                    css: menuStyle,
                                    className: mempty,
                                    children: [
                                        R.text "Заказать"
                                    ]
                                }
                            ]
                        }
                    ]    
                }
              ]
            }
            