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
    <h2>Edit Company</h2><hr>
    <g:form name="updateForm" url="[controller:'saveComp', action:'updateComp']">
        <input type="text" placeholder="Company Name" name="companyName" required value="<%=company.getCompanyName()%>">
        <input type="text" placeholder="Tax Id" name="taxId" required value="<%=company.getTaxId()%>">
        <input type="text" placeholder="Company Status" name="companyStatus" required value="<%=company.getCompanyStatus()%>">
        <input type="text" placeholder="Registration No." name="registrationNo" required value="<%=company.getRegistrationNo()%>">
        <input type="email" placeholder="Email" name="email" required value="<%=company.getEmail()%>">
        <input type="text" placeholder="Phone" name="phone" required value="<%=company.getPhone()%>">
        <input type="text" placeholder="Address" name="address" required value="<%=company.getAddress()%>">
        <input type="text" placeholder="City" name="city" required value="<%=company.getCity()%>">
        <input type="text" placeholder="State" name="state" required value="<%=company.getState()%>">
        <input type="text" placeholder="Country" name="country" required value="<%=company.getCountry()%>">
        <input type="hidden" name="companyindex" value="<%=no%>">
        <br><input type="submit" value="Update">
    </g:form>

</div>
</body>
</html>