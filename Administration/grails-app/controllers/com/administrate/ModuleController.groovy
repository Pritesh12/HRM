package com.administrate

import com.grails.Module
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class ModuleController {
    def springSecurityService
    def modulePage() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        def moduleList = Module.list()
        render(view: 'module', model: [username: name, module: moduleList])
    }
    def createModule(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render(view: 'createModule', model: [username:name])
    }
    def saveModule(Module module){
        module.setModuleCreated(params.moduleCreated)
        module.save(flush: true)
        redirect(controller: 'module', action: 'modulePage')
    }
    def updateModule(Module module){
        int id=Integer.parseInt(params.moduleindex)
        def moduleList=Module.list()
        Module mod = new Module()
        for(int i=0;i<moduleList.size();i++)
        {
            if(id==i){
                mod = moduleList.get(i)
            }
        }
        mod.setModuleName(params.moduleName)
        mod.setModuleType(params.moduleType)
        mod.setModuleCreated(params.moduleCreated)
        mod.save(flush:true)
        redirect(controller: 'module', action: 'modulePage')
    }
}
