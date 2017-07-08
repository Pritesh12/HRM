package com.administrate

import com.grails.Company
import com.grails.Employee
import com.grails.RoleEmployee
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class AdminController {
    def testRole
    def testuser
    def springSecurityService

    def employeePage() {
        def currentUser = springSecurityService.currentUser
        def name = currentUser.getUsername()
        def userList = User.list()
        def com = Company.list()
        String companyName
        Company comp = new Company()
        for (User user : userList) {
            if (user.getUsername().equals(name)) {
                String access = user.getAccessKey()
                String[] compName = access.split("_")
                for (Company company : com) {
                    if (company.getCompanyName().equals(compName[0]))
                        comp = company
                }
            }
            render(view: 'employee', model: [username: name, company: comp])
        }
    }
    def createEmployee(){
        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        def userList = User.list()
        def com = Company.list()
        Company comp = new Company()
        for(User user: userList){
            if (user.getUsername().equals(name)) {
                String access = user.getAccessKey()
                String[] compName = access.split("_")
                for (Company company : com) {
                    if (company.getCompanyName().equals(compName[0]))
                        comp = company
                }
            }
        }
        def roleList = RoleEmployee.list()
        render (view: 'createEmployee', model:[username:name, user: userList, company:comp, role:roleList])
    }

    def saveEmployee(Employee employee, User user){
        def companyList = Company.list()
        def roleList = RoleEmployee.list()
        String role
        for(RoleEmployee roleEmployee : roleList){
            if(roleEmployee.getId() == Integer.parseInt(params.role))
                role=roleEmployee.getName()
        }
        for(Company comp: companyList){
            if(comp.getId()==Integer.parseInt(params.company)){

                employee.setEmployeeRole(role)
                comp.addToEmployee(employee)
                employee.save(flush:true)
                String accessKey=comp.getCompanyName()+"_"+role+"_"+employee.getId()
                user.setAccessKey(accessKey)
                testuser= user.save(failonError: true)
                testRole=  Role.findByAuthority('ROLE_ADMIN')
                UserRole.create(testuser,testRole,true)
            }
        }
        redirect(controller: 'admin', action: 'employeePage')
    }

    def employeeModify(){

        def currentUser = springSecurityService.currentUser
        def name=currentUser.getUsername()
        User userObj = new User()
        def userList = User.list()
        def companyList = Company.list()
        Company comp = new Company()
        for(User user: userList){
            if (user.getUsername().equals(name)) {
                String access = user.getAccessKey()
                String[] accessKey = access.split("_")
                for (Company company : companyList) {
                    if (company.getCompanyName().equals(accessKey[0]))
                        comp = company
                }
            }
        }

        Employee emp = new Employee()
        for(Employee employeeObj : comp.getEmployee()){
            if(employeeObj.getId()==Integer.parseInt(params.radio)){
                emp=employeeObj
            }
        }

        if(params.modify.equals("Edit")){

            def roleList = RoleEmployee.list()
            for(User user1: userList){

                String access = user1.getAccessKey()
                String []accessKey = access.split("_")
                if(accessKey.size()>2){
                    if(Integer.parseInt(accessKey[accessKey.size()-1]) == emp.getId()){
                        userObj = user1
                    }
                }
            }
            render (view: 'editEmployee', model:[username:name, company:comp, role:roleList, employee: emp, user: userList, userObject:userObj])
        }

        if(params.modify.equals("Delete")){

            for(User user2 : userList){
                def access = user2.getAccessKey()
                String []accessData = access.split('_')
                if(accessData.size()>2){
                    if(emp.getId()==Integer.parseInt(accessData[accessData.size()-1])){
                        def userRoleList = UserRole.list()
                        for(UserRole use : userRoleList){
                            if(use.getUserId()==user2.getId()){
                                use.delete(flush: true)
                            }
                        }
                        user2.delete(flush: true)
                    }
                }
            }
            println("############"+comp.getCompanyName())
            comp.removeFromEmployee(emp)
            emp.delete()
            comp.save(flush:true)
            println("@@@@@@@@@@@@"+emp.getFirstName())

            redirect(controller: 'admin', action: 'employeePage')
        }
    }
    def updateEmployee(){
        def empList = Employee.list()
        def userList = User.list()
        String role = params.role

        String id
        for(Employee employee1 : empList){
            if(employee1.getId() == Integer.parseInt(params.empIndex)){
                employee1.setFirstName(params.firstName)
                employee1.setMiddleName(params.middleName)
                employee1.setLastName(params.lastName)
                employee1.setEmail(params.email)
                employee1.setPhone(params.phone)
                employee1.setAge(params.age)
                employee1.setLocation(params.location)
                employee1.setEmployeeRole(role)
                employee1.save(flush: true)
                id=employee1.getId()
            }
        }
        String accessKey=params.company+"_"+role+"_"+id
        println("!!!!!!!!!!"+params.userIndex)
        for(User user1: userList){
            if(user1.getId() == Integer.parseInt(params.userIndex)){
                println("!!!!!!!!!!"+user1.getId())
                println("!!!!!!!!!!"+user1.getUsername())
                user1.setUsername(params.username)
                user1.setPassword(params.password)
                user1.setAccessKey(accessKey)
                user1.save(flush: true)
            }
        }
        redirect(controller: 'admin', action: 'employeePage')
    }
}
