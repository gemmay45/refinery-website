package scripts.api

import scripts.libs.Cookies

def ucookie = Cookies.getCookieValue("username", request)

//templateModel.ucookie = ucookie