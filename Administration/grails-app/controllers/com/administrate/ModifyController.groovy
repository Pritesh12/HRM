package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.Module
import grails.plugin.springsecurity.annotation.Secured

class ModifyController {
    def springSecurityService
    @Secured('permitAll')
    def company() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        int index=Integer.parseInt(params.radio)
        def companyList= Company.list()
        Company comp=new Company()
        for(Company company : companyList){
            if(index==company.getId()){
                comp=company
            }
        }
        if(params.modify.equals("Edit")){
            def moduleList = Module.list()
            render (view: 'editCompany', model:[username:name, company:comp, module: moduleList])
        }

        else if(params.modify.equals("Delete")){
            def compName=comp.getCompanyName()
            comp.delete(flush:true)
            def userList = User.list()
            for(User user : userList){
                def access = user.getAccessKey()
                String []accessData = access.split('_')
                if(accessData.size()>1){
                    if(compName.equals(accessData[accessData.size()-3])){
                        def userRoleList = UserRole.list()
                        for(UserRole use : userRoleList){
                            if(use.getUserId()==user.getId()){
                                use.delete(flush: true)
                            }
                        }
                        user.delete(flush: true)
                    }
                }
            }
            redirect(controller: 'secure')
        }

        else if(params.modify.equals("Show")){
            def moduleList = comp.getModule().moduleName
            render (view: 'showCompany', model:[username:name, company:comp, module: moduleList])
        }
    }
    @Secured('permitAll')
    def module(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        int index=Integer.parseInt(params.radio)

        def moduleList= Module.list()
        Module module=new Module()
        for(int i=0;i<moduleList.size();i++)
        {
            if(i==index){
                module=(Module)moduleList.get(i)
            }
        }
        if(params.modify.equals("Edit")){
            render (view: 'editModule', model:[username:name, module:module, no:index ])
        }
        else if(params.modify.equals("Delete")){
            def companyList = Company.list()
            for(Company company : companyList){

                Iterator itr = company.getModule().iterator()
                while(itr.hasNext())
                {   def mod  = itr.next()
                    if(mod.getId()==module.getId()){
                        itr.remove()
                        company.removeFromModule(mod).save(flush: true)
                    }
                }
            }
            module.delete(flush: true)
            redirect(controller: 'module', action: 'modulePage')
        }
    }
}
