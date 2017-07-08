package com.grails

import com.administrate.User

class Company {

    static hasMany = [employee :  Employee, module : Module]

    String companyName
    String taxId
    String companyStatus
    String registrationNo
    String email
    String phone
    String address
    String city
    String state
    String country

    static constraints = {

        companyName nullable: true, blank: false
        taxId nullable: true, blank: false
        companyStatus nullable: true, blank: false
        registrationNo nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        address nullable: true, blank: false
        city nullable: true, blank: false
        state nullable: true, blank: false
        country nullable: true, blank: false
    }
}
