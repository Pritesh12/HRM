package com.administrate

import com.grails.Company
import grails.plugin.springsecurity.annotation.Secured

class ModifyController {
    def springSecurityService
    @Secured('permitAll')
    def index() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        int index=Integer.parseInt(params.radio)
        def companylist= Company.list()
        Company comp=new Company()
        for(int i=0;i<companylist.size();i++)
        {
            if(i==index){
                comp=(Company)companylist.get(i)
            }
        }
        if(params.modify.equals("Edit")){
            render (view: 'editCompany', model:[username:name, company:comp, no:index ])
        }else if(params.modify.equals("Delete")){
            Company.executeUpdate("delete from Company where companyName='"+comp.getCompanyName()+"'")
            redirect(controller: 'secure')
        }
    }
}
