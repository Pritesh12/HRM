package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.Module
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class SaveCompController {

    def springSecurityService
    def testRole
    def testuser

    def newComp(Company company, Employee employee, User user) {

        def role=RoleEmployee.list()
        String userRole;
        for(RoleEmployee rol : role){
            if(rol.getAccessibility().equals("high"))
                userRole=rol.getName()
        }

        //Company Save----------------------------------------
        company.setEmail(params.companyEmail)
        company.setPhone(params.companyPhone)
        String str=params.data
        def module = Module.list()
        String []moduleSelected=str.split(",")
        for(String modName :moduleSelected){
            for(Module mod : module){
                if(mod.getModuleName().equals(modName)){
                    company.addToModule(mod).save(flush:true)
                }
            }
        }

        //Employee Save---------------------------------------
        employee.setEmail(params.employeeEmail)
        employee.setPhone(params.employeePhone)
        employee.setEmployeeRole(userRole)
        company.addToEmployee(employee)
        employee.save(flush:true)

        //User Save--------------------------------------------
        String accessKey=params.companyName+"_"+userRole+"_"+employee.getId()
        user.setAccessKey(accessKey)
        testuser= user.save(failonError: true)
        testRole=  Role.findByAuthority('ROLE_ADMIN')
        UserRole.create(testuser,testRole,true)

        redirect(controller: 'secure', action: 'index')
    }

    def updateComp(Company company){
        println("##########"+params.companyIndex)
        int id=Integer.parseInt(params.companyIndex)
        def companyList=Company.list()
        for(Company comp : companyList){
            if(id==comp.getId()){
                company=comp
            }
        }
        company.setTaxId(params.taxId)
        company.setCompanyStatus(params.companyStatus)
        company.setRegistrationNo(params.registrationNo)
        company.setEmail(params.email)
        company.setPhone(params.phone)
        company.setAddress(params.address)
        company.setCity(params.city)
        company.setState(params.state)
        company.setCountry(params.country)


        Boolean check =false
        println("!!!!!!!!"+params.data)
        String modules = params.data
        String []modNames=modules.split(',')
        def moduleList = Module.list()
        for(Module module : moduleList.sort{it.id}){
            for(String mod : modNames){
                if(mod.equals(module.getModuleName())){
                    if(company.getModule().size()==0){
                        company.addToModule(module).save(flush:true)
                    }else {
                        for(Module moduleObj : company.getModule().sort{it.id}){
                            if(module.getId() != moduleObj.getId()){
                                check=true
                            }
                        }
                    }

                }
            }
            if(check){
                company.addToModule(module).save(flush:true)
                check=false
            }
        }
        Boolean remove = true
        for(Module module1 : company.getModule().sort{it.id}){
            for(String moduleName : modNames){
                if(moduleName.equals(module1.getModuleName())){
                    remove = false
                }
            }
            if(remove){
                company.removeFromModule(module1).save(flush: true)
            }
            remove=true
        }
        //company.save(flush:true)
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
