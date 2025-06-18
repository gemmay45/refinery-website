import org.apache.commons.text.StringEscapeUtils
import scripts.libs.EnvironmentOverrides
import scripts.api.SecurityServices

//def cookies = request.getCookies()

def username = request.getSession().getValue("username");

//import scripts.libs.EnvironmentOverrides

//import static org.craftercms.studio.api.v2.utils.StudioConfiguration.SECURITY_PASSWORD_REQUIREMENTS_MINIMUM_COMPLEXITY


//def context = SecurityServices.createContext(applicationContext, request)


//def ucookie = Cookies.getCookieValue("username", request)

/*
results = []
result = [:]

if (cookies != null) {
    for (int i = 0; i < cookies.length; i++) {
        result.name = cookies[i].getName()
        result.value = cookies[i].getValue()
        
        results.add(result)
    }
}

templateModel.ucookie = results
templateModel.username = username*/