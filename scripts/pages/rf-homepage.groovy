import scripts.api.SecurityServices
import scripts.libs.EnvironmentOverrides

def context = SecurityServices.createContext(applicationContext, request)


//def ucookie = Cookies.getCookieValue("username", request)

//templateModel.ucookie = ucookie