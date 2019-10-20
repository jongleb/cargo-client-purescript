{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "my-project"
, dependencies =
    [ "console"
    , "css"
    , "effect"
    , "halogen"
    , "pathy"
    , "psci-support"
    , "react-basic"
    , "react-basic-emotion"
    , "react-basic-hooks"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
