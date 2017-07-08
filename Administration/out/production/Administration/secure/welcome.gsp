<%@ page import="com.grails.Company" %>
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
                    <h3 class="h3color">HR Management</h3>
                </td>
                <td style="width:6%" align="center" valign="middle">
                    <h5 class="h5color">Welcome</h5>
                </td>
                <td style="width:15%" align="left" valign="middle">
                    <div class="dropdown">
                        <%=username%><button class="dropbtn"><span class="caret"></span></button>
                        <div class="dropdown-content">
                            <g:link controller="addComp" action="newCompPage" style="text-decoration: none">Add Company</g:link>
                            <g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link>
                            <g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link>
                            <g:link controller='logout' style="text-decoration: none">Log Out</g:link>
                            %{--<g:link>Change Password</g:link>--}%

                        </div>
                    </div>
                </td>
            </tr>
        </table>
            <table><tr><td><g:link controller="addComp" action="newCompPage" style="text-decoration: none">Add Company</g:link></td>
                <td><g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link></td>
                <td><g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link></td>
                <td><g:link controller='logout' style="text-decoration: none">Log Out</g:link></td></tr>
        </table>
    </header>
</div>
<div>
    <div class="col-sm-2" style="height:572px; background-color:lavender;" align="center">
        <g:img dir="images" file="dp.png" alt="user" width="175" height="175" style="border-radius: 1000px;padding-top: 10px" />
        <h2 style="color: #666666"><%=username%></h2>
    </div>
    <div class="col-sm-10" style="height:572px; background-color:lavenderblush;">
        <g:form name="showform" controller="modify" action="index">
    <div class="col-sm-12" style="height:470px; margin-bottom: 10px;padding-left: 0px;padding-right: 0px" >
        <table border=1 style="margin: 20px;">
            <th style="width: 3%"></th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Company Name
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Tax Id
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Company Status
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Total Employee
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Registration No.
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Email
            </th>
            <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                Phone
            </th>
            <%if(companyData!=null){
                for(int i=0;i<companyData.size();i++){
                    com.grails.Company company=(Company)companyData.get(i)
            %>
            <tr>
                <td align="center">
                    <input type="radio" name="radio" required value="${i}">
                </td>
                <td>
                    <p class="tdstyle"><%=company.getCompanyName()%></p>
                </td>
                <td>
                    <p class="tdstyle"><%=company.getTaxId()%></p>
                </td>
                <td>
                    <p class="tdstyle"><%=company.getCompanyStatus()%></p>
                </td>
                <td>
                    <p class="tdstyle"></p>
                </td>
                <td>
                    <p class="tdstyle"><%=company.getRegistrationNo()%></p>
                </td>
                <td>
                    <p class="tdstyle"><%=company.getEmail()%></p>
                </td>
                <td>
                    <p class="tdstyle"><%=company.getPhone()%></p>
                </td>
            </tr>
            <%}}%>
        </table>
    </div><div align="right" style="margin-right: 70px">
        <input type="submit" name="modify" value="Edit" style="width: 10%;margin-bottom: 0px">
        <input type="submit" name="modify" value="Delete" style="width: 10%;margin-bottom: 0px">
        </div></g:form>
    </div>

</div>
</body>
</html>