package com.grails

class Employee {

    static belongsTo = [company : Company]

    String firstName
    String middleName
    String lastName
    String email
    String phone
    String location
    String age
    String employeeRole

    static constraints = {
        firstName nullable: true, blank: false
        middleName nullable: true, blank: false
        lastName nullable: true, blank: false
        location nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        age nullable: true, blank: false
        employeeRole nullable: true, blank: false
    }
}
