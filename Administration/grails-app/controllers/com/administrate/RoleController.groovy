package com.administrate

import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class RoleController {
    def springSecurityService
    def rolePage() {
        def name = springSecurityService.currentUser.getUsername()
        def roleList = RoleEmployee.list()
        render(view: 'role', model: [username: name, role: roleList])
    }
    def newRole() {
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'createRole', model: [username: name])
    }
    def saveRole(RoleEmployee roleEmployee){
        roleEmployee.save(flush:true)
        redirect(controller: 'role', action: 'rolePage')
    }
}
