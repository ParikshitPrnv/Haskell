module Client.Apis where 

type ClientApis = UserInfoApi

type UserInfoApi = 
    "users" :> Get '[JSON] GetAllUserResponse


callUserInfoApi = client userInfoApi

server :: Server UserInfoApi
server = UserInfoApi

userInfoApi :: Proxy UserInfoApi
userInfoApi = Proxy

app :: Application
app = serve userInfoApi server

callUserInfoApi :: ExceptT ServantErr IO GetAllUserResponse
callUserInfoApi = 