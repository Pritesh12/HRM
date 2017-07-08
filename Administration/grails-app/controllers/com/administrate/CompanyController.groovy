package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class CompanyController {
    def springSecurityService
    def showEmployee(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company comp=new Company()
        def companyList=Company.list()
        for(Company company: companyList){
            if(company.getId() == Integer.parseInt(params.index)){
                comp=company
            }
        }
        render (view: 'employee', model:[username:name, company:comp])
    }

    def index(Integer max) {
        println("fhgkjlchjbkvb")

        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        params.max = Math.min(max ?: 3,3)
        def list = Company.list(params)
        println("77777777777777777777777"+params.list)
        int from = 0;
        int to = 0;
        if(!params.offset){
            params.offset = "0"
        }
        to = Integer.parseInt(params.offset)+params.max
        for(int i = from; i<=Company.count();i++){
            if(from != Company.count())
            {
                from = Integer.parseInt(params.offset)+1
            }else {
                to = Company.count()
            }
        }
        respond list, model:[companyCount: Company.count(),from:from,to:to,username:name]
    }
    def list(){
        redirect action: "index", params:params
    }

    def show(Company company) {
        respond company
    }

    def createEmployee(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company company=new Company()
        def companyList=Company.list()
        for(Company comp:companyList){
            if(comp.getId()==Integer.parseInt(params.index)){
                company=comp
            }
        }
        render (view: 'createEmployee', model:[username:name, comp:company])
    }
    def saveEmployee(Employee employee){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company com=new Company()
        def companyList = Company.list()
        for(Company comp: companyList){
            if(comp.getId()==Integer.parseInt(params.company)){
                com=comp
                employee.setEmployeeRole("ESS")
                com.addToEmployee(employee)
                employee.save(flush:true)
            }
        }
        redirect(controller: 'company', action: 'showEmployee')
        render (view: 'employee', model:[username: name, company: com])
    }
    def roleAssignPage(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        Company comp=new Company()
        def companyList=Company.list()
        for(Company company : companyList){
            if(company.getId()==Integer.parseInt(params.index)){
                comp=company
            }
        }
        def emp=Employee.list()
        def roleList = RoleEmployee.list()
        render (view: 'roleAssign', model:[username:name, company:comp, employee:emp, role:roleList])
    }
    def roleAssign(){
        def empList = Employee.list()
        println("!!!!!"+params.data)
        println("!!!!!"+params.radio)
        for(Employee emp: empList){
            if(emp.getId()==Integer.parseInt(params.radio)){
                emp.setEmployeeRole(params.data)
                emp.save(flush:true)
            }
        }
    }
}
