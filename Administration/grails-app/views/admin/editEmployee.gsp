<%@ page import="com.grails.RoleEmployee; com.grails.Company" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="configstyle.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Digital Marketing | Camapign</title>
    <g:javascript>
    var userCheck=true;
    var req = true;
    function act(){
        //Field Check---------------------
        if(document.getElementById('firstName').value == "" || document.getElementById('lastName').value == "" || document.getElementById('email').value == "" || document.getElementById('username').value == "" || document.getElementById('password').value == ""){
            req = false;
            alert("Required fields are empty")
        }

        //Username check-------------------
        <% if (user != null) {
        for (com.administrate.User userDetail : user) {
    %>

        if(document.getElementById('username').value == "${userDetail.getUsername()}"){
             userCheck=false;
          }
        <% }
        } %>

        if(document.getElementById('username').value == "${userObject.getUsername()}"){
            userCheck=true;
        }

        if(req){
            if(userCheck){
                document.getElementById("editEmployee").submit();
            }else {
                userCheck = true;
                alert("Username already exists")
            }
        }else {
            req=true;
        }
    }
    </g:javascript>
</head>
<body>

<div class="container">
    <header style="padding: 0px">
        <table border=0 style="width:100%">
            <tr>
                <td style="width:80%">
                    <h3 class="h3color">HR Management</h3>
                </td>
                <td style="width:6%" align="center" valign="middle">
                    <h5 class="h5color">Welcome</h5>
                </td>
                <td style="width:15%" align="left" valign="middle">
                    <div class="dropdown">
                        <%=username%><button class="dropbtn"><span class="caret"></span></button>
                        <div class="dropdown-content">
                            <g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link>
                            <g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link>
                            <g:link controller='logout' style="text-decoration: none">Log Out</g:link>

                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <table><tr>
            <td><g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link></td>
            <td><g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link></td>
            <td><g:link controller='logout' style="text-decoration: none">Log Out</g:link></td></tr>
        </table>
    </header>
</div><div align="center">
<div align="center">
    <h2 style="margin-top: 5px;margin-bottom: 5px">Create Employee</h2><hr>
    <g:form name="editEmployee" url="[controller:'admin', action:'updateEmployee']">

        <input type="text" placeholder="First Name*" id="firstName" name="firstName" required value="<%=employee.getFirstName()%>">
        <input type="text" placeholder="Middle Name" id="middleName" name="middleName" value="<%=employee.getMiddleName()%>">
        <input type="text" placeholder="Last Name*" id="lastName" name="lastName" required value="<%=employee.getLastName()%>">
        <input type="email" placeholder="Email*" id="email" name="email" required value="<%=employee.getEmail()%>">
        <input type="text" placeholder="Phone*" id="phone" name="phone" required value="<%=employee.getPhone()%>">
        <input type="number" placeholder="Age*" id="age" name="age" required value="<%=employee.getAge()%>">
        <input type="text" placeholder="Location*" id="location" name="location" required value="<%=employee.getLocation()%>"><hr>
        <input type="text" placeholder="Username*" id="username" name="username" required value="<%=userObject.getUsername()%>">
        <input type="text" placeholder="Password*" id="password" name="password" required value="">
        <select name="role">
            <option value="<%=employee.getEmployeeRole()%>"><%=employee.getEmployeeRole()%></option>
            <%for(com.grails.RoleEmployee roleEmployee : role){
                if(!(roleEmployee.getName().equals(employee.getEmployeeRole())))
            %>
            <option value="<%=roleEmployee.getName()%>"><%=roleEmployee.getName()%></option>

            <%}%>
        </select>
        <h3 style="margin-top: 10px">Select Company</h3>
        <select name="company">
            <option value="<%=company.getCompanyName()%>"><%=company.getCompanyName()%></option>
        </select>
        <input type="hidden" name="empIndex" value="<%=employee.getId()%>">
        <input type="hidden" name="userIndex" value="<%=userObject.getId()%>">
        <br><button type="button" class="submitbutton" style="margin-top: 5px;color: white" onclick="act()">Create</button>
        </div>

    </g:form>
</div>
</body>
</html>