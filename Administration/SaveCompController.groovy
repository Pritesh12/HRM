package com.administrate

import com.grails.Company
import grails.plugin.springsecurity.annotation.Secured


class SaveCompController {
def springSecurityService
    @Secured('permitAll')
    def newComp() {
        def company = new Company(params)
        if(company.validate()) {
            company.save(flush: true)
            redirect(controller: 'secure', action: 'index')
        }else {
            redirect(controller: 'saveComp', action: 'failed')
        }
    }
    //===============================================================
    @Secured('permitAll')
    def updateComp(){
        println("!!!!!!!!"+params.companyindex)
        int id=Integer.parseInt(params.companyindex)
        def companyList=Company.list()
        Company company = new Company()
        for(int i=0;i<companyList.size();i++)
        {
            if(id==i){
                company = companyList.get(i)
            }
        }
        company.setCompanyName(params.companyName)
        company.setTaxId(params.taxId)
        company.setCompanyStatus(params.companyStatus)
        company.setRegistrationNo(params.registrationNo)
        company.setEmail(params.email)
        company.setPhone(params.phone)
        company.setAddress(params.address)
        company.setCity(params.city)
        company.setState(params.state)
        company.setCountry(params.country)
        company.save(flush:true)
        redirect(controller: 'secure', action: 'index')
    }

    @Secured('permitAll')
    def success(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render (view: 'successPage', model:[username:name ])
    }
    @Secured('permitAll')
    def failed(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        render (view: 'failedPage', model:[username:name ])
    }
}
