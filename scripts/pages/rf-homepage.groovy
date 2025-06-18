package scripts.api

import scripts.libs.Cookies

def cookies = request.getCookies()



//import scripts.libs.EnvironmentOverrides

//import static org.craftercms.studio.api.v2.utils.StudioConfiguration.SECURITY_PASSWORD_REQUIREMENTS_MINIMUM_COMPLEXITY


//def context = SecurityServices.createContext(applicationContext, request)


//def ucookie = Cookies.getCookieValue("username", request)

result = [:]

if (cookies != null) {
    for (int i = 0; i < cookies.length; i++) {
        def name = cookies[i].getName()
        def value = cookies[i].getValue()
    
        if(name == cookieName) {
            result = value
            break
        }
    }
}

templateModel.ucookie = cookies