package com.administrate

import com.grails.Module
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class AdminModuleController {
def springSecurityService
    def modulePage() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        Module module = new Module()
        def moduleList = Module.list()
        for(Module mod : moduleList){
            if(mod.getModuleName().equals(params.module)){
                module = mod
            }
        }
        render(view: 'module', model: [username: name, module: module])
    }

    def delete(){

    }
}
