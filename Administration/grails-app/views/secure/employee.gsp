<%@ page import="com.grails.Module" %>
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
</head>
<body>

<div class="container">
    <header style="padding: 0px">
        <table border=0 style="width:100%">
            <tr>
                <td style="width:80%">
                    <h3 class="h3color"><%=company.getCompanyName()%></h3>
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
                            %{--<g:link>Change Password</g:link>--}%

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
</div>
<div align="center">

    <table border="0">
        <tr>
            <td><h4 style="color: #666666">Name</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCompanyName()%></td>
        </tr>

        <tr>
            <td><h4 style="color: #666666">Email</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getEmail()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Phone</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getPhone()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Address</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getAddress()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">City</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCity()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">State</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getState()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Country</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCountry()%></td>
        </tr>
    </table>
    <h3>Personal Information</h3><hr>
        <table border="1">
            <tr>
                <td><b>Name</b></td><td style="padding-left: 10px">:</td>
                <td style="padding-left: 30px"><%=employee.getFirstName()%> <%=employee.getMiddleName()%> <%=employee.getLastName()%></td>
            </tr>
            <tr>
                <td><b>Email</b></td><td style="padding-left: 10px">:</td>
                <td style="padding-left: 30px"><%=employee.getEmail()%></td>
            </tr>
            <tr>
                <td><b>Phone</b></td><td style="padding-left: 10px">:</td>
                <td style="padding-left: 30px"><%=employee.getPhone()%></td>
            </tr>
            <tr>
                <td><b>Address</b></td><td style="padding-left: 10px">:</td>
                <td style="padding-left: 30px"><%=employee.getLocation()%></td>
            </tr>
        </table>


</div>
</body>
</html>