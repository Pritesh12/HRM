package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.Module
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class SignUpController {
    def testRole
    def testuser

    def signUpPage() {
        def moduleNames = Module.executeQuery("select moduleName from Module")
        def userList = User.list()
        def companyList = Company.list()
        render (view: 'signUp', model: [module: moduleNames, user: userList, company:companyList])
    }
    def saveSignUp(Employee employee, Company company, User user){

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
        String []moduleSelected=str.split(",");
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

        redirect(uri: "/")
    }
}
