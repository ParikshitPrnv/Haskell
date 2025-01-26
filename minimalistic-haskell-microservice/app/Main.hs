module Main where

main :: IO ()
main = do
    putStrLn "Rom Rom Bhaiyo!"
    mgr <- newManager defaultManageSettings
    run 8081 (app mgr)

app :: Manager -> Application
app mgr req respond = 
    case pathInfo req 