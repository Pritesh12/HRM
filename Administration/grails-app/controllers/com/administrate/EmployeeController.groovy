package com.administrate

import com.grails.Company
import com.grails.Employee
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class EmployeeController {
    def springSecurityService
    def employeePage() {
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        def companyList= Company.list()
        def empList = Employee.list()
        render(view: 'show', model: [username: name, employee: empList, company: companyList])
    }

    def newEmployee(){
        def currentUser = springSecurityService.currentUser
        def companyList = Company.list()
        def name=currentUser.getUsername()
        render (view: 'create', model:[username:name, company:companyList])
    }

    def saveEmployee(Employee employee) {
        def companyList = Company.list()
        for(Company comp: companyList){
            if(comp.getId()==Integer.parseInt(params.company)){
                employee.setEmployeeRole("ESS")
                comp.addToEmployee(employee)
                employee.save(flush:true)
            }
        }
        redirect(controller: 'employee', action: 'employeePage')
    }

}
