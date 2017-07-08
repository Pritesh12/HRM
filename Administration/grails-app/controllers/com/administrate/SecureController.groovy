package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class SecureController {
    def springSecurityService

    def index() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        def userList = User.list()
        for( User user : userList){
            if(user.getUsername().equals(name)){
                if(user.getAccessKey().equals("super")){
                    redirect(controller: 'secure', action: 'superAdminPage')
                }else {
                    def roleList = RoleEmployee.list()
                    def accessKey = user.getAccessKey()
                    String []accessData = accessKey.split('_')
                    RoleEmployee role;
                    for(RoleEmployee roleEmployee : roleList){
                        if(roleEmployee.getName().equals(accessData[accessData.size()-2])){
                            role=roleEmployee
                        }
                    }
                    println("//////////"+role.getAccessibility())
                    if(role.getAccessibility().equals('high')){
                        redirect(controller: 'secure', action: 'adminPage')
                    }else if(role.getAccessibility().equals('low')){
                        redirect(controller: 'secure', action: 'employeePage')
                    }

                }
            }
        }
    }

    def superAdminPage(Integer max){
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        params.max = Math.min(max ?: 3,3)
        def companyList= Company.list(params)
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
                println("fifififififififififi" +from)
            }else {
                to = companyList
            }
        }
        if( to > Company.count()){
            to = Company.count()
        }

        render (view: 'superAdmin', model:[username: name,companyData: companyList,from:from,to:to,companyCount:Company.count()])
    }

    def list(){
        redirect action: "supe" +
                "rAdminPage", params:params
    }


    def adminPage(){
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        Company companyData = new Company()
        def userList = User.list()
        for( User user : userList) {
            if (user.getUsername().equals(name)) {
                String []adminDetail = user.getAccessKey().split("_")
                def roleEmp=RoleEmployee.list()
                for(RoleEmployee roleEmployee : roleEmp){
                    if(roleEmployee.getAccessibility().equals("high")){
                        if(adminDetail[1].equals(roleEmployee.getName())){
                            def companyList = Company.list()
                            for(Company comp: companyList){
                                if(adminDetail[0].equals(comp.getCompanyName())){
                                    companyData=comp
                                }
                            }
                        }
                    }
                }
                def moduleList = companyData.getModule()
                render (view: 'admin', model:[username:name, company:companyData, module: moduleList])
            }
        }
    }



    def employeePage(){
        println("Employee Page")
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        Company companyData = new Company()
        Employee employeeObj = new Employee()
        def userList = User.list()
        int empId
        for( User user : userList) {
            if (user.getUsername().equals(name)) {
                String []accessDetail = user.getAccessKey().split("_")
                empId = Integer.parseInt(accessDetail[accessDetail.size()-1])
                def roleEmp=RoleEmployee.list()
                for(RoleEmployee roleEmployee : roleEmp){
                    if(roleEmployee.getAccessibility().equals("low")){
                        if(accessDetail[1].equals(roleEmployee.getName())){
                            def companyList = Company.list()
                            for(Company comp: companyList){
                                if(accessDetail[0].equals(comp.getCompanyName())){
                                    companyData=comp
                                }
                            }
                        }
                    }
                }
            }
        }
        for(Employee emp : companyData.getEmployee()){
            if(emp.getId() == empId){
                employeeObj=emp
            }
        }
        println("##########"+employeeObj.getFirstName())
        render (view: 'employee', model:[username: name, company: companyData, employee:employeeObj])
    }
}
