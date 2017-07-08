package com.grails

class Module {


    String moduleName
    String moduleType
    String moduleCreated

    static constraints = {
        moduleName nullable: true, blank: false
        moduleType  nullable: true, blank: false
        moduleCreated  nullable: true, blank: false
    }
}
