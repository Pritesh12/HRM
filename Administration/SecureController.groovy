package com.administrate

import com.grails.Company
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class SecureController {
    def springSecurityService

    def index() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        def companyList= Company.list()
        render (view: 'welcome', model:[username:name,companyData:companyList])
    }
}
