module Landing.Advert.Gazel where

import Prelude

import Effect (Effect)
import React.Basic.DOM as R
import React.Basic.Emotion as E
import React.Basic.Hooks (ReactComponent, component, JSX)

foreign import gazelImg :: String

gazelStyle :: E.Style
gazelStyle = E.css 
    {   position: E.str "absolute"
    ,   transform: E.str "translate(-50%, 0)"    
    ,   left: E.str "50%"
    ,   width: E.str "971px"
    ,   top: E.str "167px"
    }

gazelWrapStyle :: E.Style
gazelWrapStyle = E.css 
    {
        position: E.str "relative"        
    }  

imgStyle :: E.Style 
imgStyle = E.css
    {
        position: E.str "absolute",
        right: E.str "432px",
        top: E.str "-22px"
    }    

listStyle :: E.Style
listStyle = E.css
    {
        position: E.str "absolute",
        right: E.str "0",
        textAlign: E.str "right"
    }    

listItemStyle :: E.Style
listItemStyle = E.css
    {
        fontFamily: E.str "Qanelas-Regular",
        fontSize: E.str "43px",
        color: E.str "#fff",
        fontWeight: E.str "600",
        "&:nth-child(2)": E.selector 
            $ E.css
            {   
                marginTop: E.str "33px"
            },
        "&:nth-child(3)": E.selector 
            $ E.css
            {   
                marginTop: E.str "36px"
            },    
        "&:nth-child(4)": E.selector 
            $ E.css
            {   
                marginTop: E.str "42px"
            }
    }

sendButton :: JSX
sendButton = E.element R.button'
    { css: E.css{
        background: E.str "#FFF153",
        borderRadius: E.str "20px",
        fontFamily: E.str "Qanelas-Regular",
        fontSize: E.str "22px",
        color: E.str "#3a3a3a",
        right: E.str "97px",
        top: E.str "361px",
        position: E.str "absolute",
        width: E.str "244px",
        height: E.str "45px"
    }
    , className: mempty
    , children: [R.text "Оформить заказ"]
    }    
    
    
mkMenuItem :: String -> JSX
mkMenuItem text = E.element R.div'
        { css: listItemStyle
        , className: mempty
        , children: [
            R.span{children: [R.text text]}
        ]
        }
        

mkGazel :: Effect (ReactComponent {})
mkGazel = do
    component "Gazel" \_ -> do
        pure $ E.element R.div'{
            css: gazelStyle,
            className: mempty,
            children: [
                E.element R.div'
                {
                    css: gazelWrapStyle,
                    className: mempty,
                    children: [
                        E.element R.div'
                        {
                          css: imgStyle,
                          className: mempty,
                          children: [
                              R.img {
                                  src: gazelImg
                              }
                          ]  
                        },
                        E.element R.div'
                        {css: listStyle
                        ,   className: mempty
                        ,   children: [  
                                mkMenuItem "ПЕРЕВОЗКА СТРОЙМАТЕРИАЛОВ",
                                mkMenuItem "КВАРТИРНЫЙ ПЕРЕЕЗД",
                                mkMenuItem "ПЕРЕВОЗКА МЕБЕЛИ",
                                mkMenuItem "ГРУЗЧИКИ"
                            ]    
                        },
                        sendButton
                    ]   
                }
            ]
        }