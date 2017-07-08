package com.grails

class RoleEmployee {
    String name
    String type
    String accessibility
    String priority

    static constraints = {
        name nullable: true, blank: false
        type nullable: true, blank: false
        accessibility nullable: true, blank: false
        priority nullable: true, blank: false
    }
}
