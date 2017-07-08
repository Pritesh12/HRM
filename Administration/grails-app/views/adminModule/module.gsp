<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <asset:stylesheet src="home_view_style.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin module | HRM</title>
</head>
<body>

<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px;padding-top:10px;padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Human Resource Management </h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>

        </div>
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana; margin: 15px 0 15px 0;padding-left:8px">Module Details</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdminPage"><g:message code="Home"/></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="addComp" action="newCompPage">Add Company</g:link></li>
                    <li><g:link class="list" controller="Company" action="showCompany">Company List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a  class="dropdown-toggle" data-toggle="dropdown" href="#">Employee<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="Employee" action="employeePage">Employee List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Module<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="Module" action="createModule">Add Module</g:link></li>
                    <li><g:link controller="Module" action="modulePage">Module List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Role<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="role" action="newRole">Add Role</g:link></li>
                    <li><g:link controller="role" action="rolePage">Role List</g:link></li>
                </ul>
            </li>

        </ul><br>
    </div>
</div>
<div class="col-md-12">
    <div>
        <div class="box,col-md-12">
            <div class="inner" style="padding-bottom:10px; font-size:20px;height: auto;background-color: #f7f6f6">
<g:form>

%{-- Admin Module part --}%

    <div class="col-md-12" style="padding: 20px 0 10px 0;margin-top: 10px;background-color: #f7f6f6" >
        <div class="col-md-6">
            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                <p style="padding-right:10px">Name </p>
            </div>
            <div class="col-md-8">
                <p>${module.moduleName}</p>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="padding: 20px 0 10px 0;margin-top: 10px;background-color: #f7f6f6" >
    <div class="col-md-6">
        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
            <p style="padding-right:10px">Module type </p>
        </div>
        <div class="col-md-8">
            <p>${module.moduleType}</p>
        </div>
    </div>
    </div>
    <div class="col-md-12" style="padding: 20px 0 10px 0;margin-top: 10px;background-color: #f7f6f6" >
    <div class="col-md-6">
        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
            <p style="padding-right:10px">Date Created</p>
        </div>
        <div class="col-md-8">
            <p>${module.moduleCreated}</p>
        </div>
    </div>
</div>
    <div class="col-md-12" style="background-color: #f7f6f6";>
        <hr>
    </div>
    <center><g:link controller="secure" style="font-size:20px;color: #2b406e;"><b>Back</b></g:link></center>
</g:form>

            </div>
        </div>
    </div>
</div>
</body>
</html>