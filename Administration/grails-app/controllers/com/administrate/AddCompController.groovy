package com.administrate

import com.grails.Company
import com.grails.Module
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class AddCompController {

    def springSecurityService
    def newCompPage() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        def moduleNames = Module.executeQuery("select moduleName from Module")
        def userList = User.list()
        def companyList = Company.list()

        render (view: 'createCompany', model:[username : name, module : moduleNames, user:userList, company: companyList])
    }
}
