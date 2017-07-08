package com.administrate
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class AddCompController {

    def springSecurityService
    def newCompPage() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        render (view: 'createCompany', model:[username:name])
    }
}
