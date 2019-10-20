module Landing.Advert.Header where

import Prelude

import CSS (marginLeft)
import Effect (Effect)
import React.Basic.DOM as R
import React.Basic.Emotion as E
import React.Basic.Hooks (ReactComponent, component, JSX)

foreign import logo :: String

headStyle :: E.Style
headStyle = E.css 
    {   position: E.str "absolute"
    ,   transform: E.str "translate(-50%, 0)"
    ,   left: E.str "50%"
    ,   width: E.str "971px"
    ,   top: E.str "30px"
    }

wrapStyle :: E.Style
wrapStyle = E.css 
    {   position: E.str "relative"
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
        fontFamily: E.str "ArialMT",
        display: E.str "flex"
    }

menuItemStyle :: E.Style
menuItemStyle = E.css {
    maxHeight: E.str "23px",
    cursor: E.str "pointer",
    whiteSpace: E.str "nowrap",
    "&:not(:last-child)": E.selector 
            $ E.css
            {   
                borderRight: E.str "1px solid",
                paddingRight: E.str "14px"
            },
    "&:not(:first-child)": E.selector 
            $ E.css
            {   
                marginLeft: E.str "14px"
            },                
    "&:nth-child(2)": E.selector 
            $ E.css
            {   
                paddingRight: E.str "18px"
            },   
    "&:nth-child(3)": E.selector 
            $ E.css
            {   
                marginLeft: E.str "18px",
                paddingRight: E.str "21px"
            },   
    "&:nth-child(4)": E.selector 
            $ E.css
            {   
                marginLeft: E.str "18px"
            }                
}

callRequestStyle :: E.Style
callRequestStyle = E.css 
    {
        marginLeft: E.str "40px",
        span: E.selector$ E.css {
            color: E.str "#fff",
            fontFamily: E.str "Qanelas-Regular",
            fontSize: E.str "22.5px",
            marginLeft: E.str "3px"
        },
        button: E.selector$ E.css{
            background: E.str "#FFF153",
            padding: E.str "10px 22px 7px 18px",
            marginTop: E.str "10px",
            borderRadius: E.str "20px",
            fontFamily: E.str "Qanelas-Regular",
            fontSize: E.str "16px",
            width: E.str "177px",
            color: E.str "#3a3a3a"
        }
    }   

mkMenuItem :: String -> JSX
mkMenuItem text = E.element R.div'
    { css: menuItemStyle
    , className: mempty
    , children: [
        R.span{children: [R.text text]}
    ]
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
                                        mkMenuItem "Заказать",
                                        mkMenuItem "Услуги и Цены",
                                        mkMenuItem "О компании",
                                        mkMenuItem "Контакты"
                                    ]
                                },
                                E.element R.div' {
                                    css: callRequestStyle,
                                    className: mempty,
                                    children: [
                                        R.span{
                                            children: [
                                                R.text "8 (927) 231 50 23"
                                            ]
                                        },
                                        R.button {
                                            children: [
                                                R.text "Обратный звонок"
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    ]    
                }
              ]
            }
            