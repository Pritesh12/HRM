<%@ page import="com.grails.Module" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="configstyle.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Module | HRM</title>
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
        <g:link controller="module" action="createModule" style="color: black;text-decoration: none">Create Module</g:link>
    </div>
    <div class="col-sm-10" style="height:572px; background-color:lavenderblush;">
        <g:form name="showModuleForm" controller="modify" action="module">
            <div class="col-sm-12" style="height:470px; margin-bottom: 10px;padding-left: 0px;padding-right: 0px" >
                <table border=0 style="margin: 20px;">
                    <th style="width: 3%"></th>
                    <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                        Module Name
                    </th>
                    <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                        Module Type
                    </th>
                    <th align="center" style="padding-top: 10px; padding-bottom: 10px; width: 10%">
                        Module Created
                    </th>
                    <%if(module!=null){
                        for(int i=0;i<module.size();i++){
                            com.grails.Module module=(Module)module.get(i)
                    %>
                    <tr>
                        <td align="center">
                            <input type="radio" name="radio" required value="${i}">
                        </td>
                        <td>
                            <p class="tdstyle"><%=module.getModuleName()%></p>
                        </td>
                        <td>
                            <p class="tdstyle"><%=module.getModuleType()%></p>
                        </td>
                        <td>
                            <p class="tdstyle"><%=module.getModuleCreated()%></p>
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