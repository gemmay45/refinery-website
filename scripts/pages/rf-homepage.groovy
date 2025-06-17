//import org.apache.commons.text.StringEscapeUtils
//import org.slf4j.LoggerFactory
//import scripts.api.SecurityServices

//def context = SecurityServices.createContext(applicationContext, request)
//def currentUser = SecurityServices.getCurrentUser(context)

import scripts.api.impl.security.SpringSecurityServices
import scripts.api.impl.user.SpringUserServices

//String username = securityService.getCurrentUser();

//import org.craftercms.sites.editorial.ProfileUtils

//import org.craftercms.sites.editorial.ProfileUtils

/*
def segment = ProfileUtils.getSegment(profile, siteItemService)

def roles = ProfileUtils.getRoles(profile, siteItemService)

if (roles != null)
{
templateModel.roles = roles.size()
}
*/

//def context = SecurityServices.createContext(applicationContext, request)
//def currentUser = SecurityServices.getCurrentUser(context)

/*
import scripts.libs.EnvironmentOverrides


import static org.craftercms.studio.api.v2.utils.StudioConfiguration.SECURITY_PASSWORD_REQUIREMENTS_MINIMUM_COMPLEXITY

def logger = LoggerFactory.getLogger(this.class)

def context = SecurityServices.createContext(applicationContext, request)

def result = [:]
def currentUser = SecurityServices.getCurrentUser(context)
def email = ""
def firstname = ""
def lastname = ""
def authenticationType = ""
def profile = null
def studioConfigurationSB = context.applicationContext.get("studioConfiguration")
def passwordRequirementsMinComplexity = studioConfigurationSB.getProperty(SECURITY_PASSWORD_REQUIREMENTS_MINIMUM_COMPLEXITY).toInteger()
def userServiceSB = context.applicationContext.get("userService")

def authenticatedUser = null;

if (!authenticationType) {
    try {
        authenticatedUser = userServiceSB.getCurrentUser()
    } catch (error) {
        // do nothing
    }
}

try {
    profile = SecurityServices.getUserProfile(context, currentUser)
} catch(e) {
    profile = [:]
    profile.email = email
    profile.first_name = firstname
    profile.last_name = lastname
    profile.authentication_type = authenticationType;
}

model.username = currentUser
model.userEmail = profile.email
model.userFirstName = profile.first_name
model.userLastName =  profile.last_name
model.authenticationType =  authenticatedUser?
        authenticatedUser.getAuthenticationType() as String : profile.authentication_type
model.cookieDomain = StringEscapeUtils.escapeXml10(request.getServerName())
model.passwordRequirementsMinComplexity = passwordRequirementsMinComplexity;
model.envConfig = EnvironmentOverrides.getMinimalValuesForSite(applicationContext, request)
*/