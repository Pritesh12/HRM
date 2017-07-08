<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <asset:stylesheet src="home_view_style.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin | HRM</title>
</head>
<body>

%{-- header section --}%
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
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

    %{-- Dropdown navigation --}%
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana;margin: 15px 0 15px 0 ">${company.companyName}</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdminPage"><g:message code="Home"/></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="addComp" action="newCompPage">Add Company</g:link></li>
                    <li><g:link class="list" controller="Company" action="index">Company List</g:link></li>
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
            <div class="inner" style="font-size:20px;height: auto;background-color: #f7f6f6">
                <g:form controller="adminModule" action="modulePage">

                    %{-- Admin part --}%

                    <div class="col-md-12" style="padding: 25px 0 10px 0;background-color: #f7f6f6; margin-top: 10px" >
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px">Name </p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.companyName}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px">
                                <p style="padding-left:0px">Tax Id</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.taxId}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12" style="padding: 10px 0 10px 0;background-color:#f7f6f6">
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px">Company status</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.taxId}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;background-color:#f7f6f6">
                                <p style="padding-left:0px">Registration No</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.registrationNo}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12" style="padding: 10px 0 10px 0;background-color:#f7f6f6">
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;background-color:#f7f6f6" >
                                <p style="padding-right:10px">Email</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.email}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;background-color:#f7f6f6">
                                <p style="padding-left:0px">Phone</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.phone}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 10px 0 10px 0;background-color:#f7f6f6" >
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;background-color:#f7f6f6" >
                                <p style="padding-right:10px">Address</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.address}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;background-color:#f7f6f6">
                                <p style="padding-left:0px">City</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.city}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 10px 0 10px 0;background-color:#f7f6f6">
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px">State</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.state}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 10px 0 10px 0;background-color:#f7f6f6">
                        <div class="col-md-6">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px">Country</p>
                            </div>
                            <div class="col-md-8">
                                <p>${company.country}</p>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
                    %{--List of Modules--}%
<div class="col-md-12">
    <div>
        <div class="box,col-md-12">
            <div class="inner;col-md-12" style="font-size:20px;height: auto;background-color: #f7f6f6">
                <fieldset style="padding:10px 10px 0 12px;text-align: center;font-family: Verdana">Module(s)</fieldset>
                <g:if test="${module != null}">
                    <g:each in="${module}" status="i" var="mod">
                       <h1 style="text-align: center;padding: 20px 0 10px 0;margin: 0 0 30px 0">
                        <g:link>
                            <input type="submit" name="module" value="${mod.moduleName}" style="border: none; text-shadow: none; padding:2px; margin-bottom: 3px; margin-top: 3px; color:#204060; background-color: #f7f6f6; box-shadow:none"></h1>
                        </g:link>
                    </g:each>
                </g:if>
            </div>
        </div>
    </div>
</div>
</g:form>
</body>
</html>