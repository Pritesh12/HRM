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
    var compCheck=true;
    var final=[];
    var req = true;
    window.onload=function(){
        var length=${module.size()}
            var i;
            for (j = 0; j < length; j++) {
            document.getElementById("row"+j).style.display='none';
            }
        }

        function moduleSelect(){

            <%if(module!=null){
                for(int i=0;i<module.size();i++){
            %>
            if(document.getElementById('checkAvailable${i}').checked){
            document.getElementById("row${i}").style.display='block';
            document.getElementById("rowAvailable${i}").style.display='none';
            document.getElementById("checkAvailable${i}").checked = false;

        }
            <%}}%>

        }
        function moduleRemove() {
            <%if(module!=null){
                for(int i=0;i<module.size();i++){
            %>
            if(document.getElementById('checkSelect${i}').checked){

            document.getElementById("row${i}").style.display='none';
            document.getElementById("rowAvailable${i}").style.display='block';
            document.getElementById("checkSelect${i}").checked = false;
        }
            <%}}%>
        }

        function act(){
            var moduleStore=0;

            //Module Select--------------------
            <%if(module != null) {
                for (int no = 0; no < module.size(); no++){%>
            if(document.getElementById("row${no}").style.display != 'none'){
                final[moduleStore]=document.getElementById('checkSelect${no}').value;
                moduleStore++;
            }<%}}%>

            //Field Check---------------------
            if(document.getElementById('firstName').value == "" || document.getElementById('lastName').value == "" || document.getElementById('employeeEmail').value == "" || document.getElementById('username').value == "" || document.getElementById('password').value == "" || document.getElementById('companyName').value == "" || document.getElementById('taxId').value == "" || document.getElementById('registrationNo').value == "" || document.getElementById('companyEmail').value == "" || document.getElementById('companyPhone').value == "" || document.getElementById('address').value == "" || document.getElementById('city').value == "" || document.getElementById('state').value == "" || document.getElementById('country').value == ""){
                req = false
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

            //Company name check-------------------
            <% if (company != null) {
                for (com.grails.Company companyDetail : company) {
            %>

            if(document.getElementById('companyName').value == "${companyDetail.getCompanyName()}"){
             compCheck=false;
          }
            <% }
            } %>
            if(req){
                if(userCheck){
                    if(compCheck){
                        if (final.length < 1) {
                            alert("Module not selected")
                        }
                        else{
                            document.getElementById('formData').value=final;
                            document.getElementById("compForm").submit();
                        }
                    }else {
                        compCheck = true;
                        alert("Company Name already exists")
                    }
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
    <h2 style="margin-top: 5px;margin-bottom: 5px">Create Company</h2><hr style="margin-top: 0px">
    <g:form name="compForm" url="[controller:'saveComp', action:'newComp']">
    <h3 style="margin-top: 10px">Admin Details</h3>
        <input type="text" placeholder="First Name*" id="firstName" name="firstName" value="Abhishek">
        <input type="text" placeholder="Middle Name" id="middleName" name="middleName" value="">
        <input type="text" placeholder="Last Name*" id="lastName" name="lastName" value="Gharai">
        <input type="email" placeholder="Email*" id="employeeEmail" name="employeeEmail" value="abhishek.gharai95@gmail.com">
        <input type="text" placeholder="Phone" id="employeePhone"  name="employeePhone" value="9148939424">
        <input type="number" min="18" max="50" placeholder="Age" id="age" name="age" value="22">
        <input type="text" placeholder="Location" id="location" name="location" value="Brookefield">

        <br><hr style="margin-top: 0px;margin-bottom: 0px">

        <input type="text" placeholder="Username*" id="username" name="username" value="" onchange="usernameCheck()">
        <input type="password" placeholder="Password*" id="password" name="password" value="1234">

        <hr style="margin-top: 0px;margin-bottom: 0px">
        <h3 style="margin-top: 10px">Company Details</h3>

        <input type="text" placeholder="Company Name*" id="companyName" name="companyName" value="" onchange="companyNameCheck()">
        <input type="text" placeholder="Tax Id*" id="taxId" name="taxId" value="0123">
        <input type="text" placeholder="Company Status" id="companyStatus" name="companyStatus" value="active">
        <input type="text" placeholder="Registration No.*" id="registrationNo" name="registrationNo" value="00123">
        <input type="email" placeholder="Email*" id="companyEmail" name="companyEmail" value="excite@gmail.com">
        <input type="text" placeholder="Phone*" id="companyPhone" name="companyPhone" value="9876543210">
        <input type="text" placeholder="Address*" id="address" name="address" value="ITPL">
        <input type="text" placeholder="City*" id="city" name="city" value="Bangalore">
        <input type="text" placeholder="State*" id="state" name="state" value="Karnataka">
        <input type="text" placeholder="Country*" id="country" name="country" value="India">
        <hr style="margin-top: 0px;margin-bottom: 0px">
        %{--<br><input type="submit" value="Create">--}%

</div>
<div class="col-sm-12" align="center">
<h3 style="margin-top: 10px">Select Module</h3>
    <div class="col-sm-5" align="center">
        <div class="col-sm-6" style="float:right;border-radius: 10px; background-color: #f2f2f2">
            <h4>Available Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
            <table border="0" style="width:100%;margin: 5px">
                <%if(module!=null){
                    for(int i=0;i<module.size();i++){
                %>
                <tr id="rowAvailable${i}">
                <td><input type="checkbox" name="check" id="checkAvailable${i}" value="${module[i]}"></td>
                <td>
                    <%=module[i]%>
                </td>
            </tr>
                <%}}%>
            </table>
        </div>
    </div>
    <div class="col-sm-2" align="center" style="padding:5px">
        <div style="padding:1px"><a onclick="moduleSelect()">
            <span class="glyphicon glyphicon-circle-arrow-right"></span>
        </a></div>
        <div style="padding:1px"><a onclick="moduleRemove()">
            <span class="glyphicon glyphicon-circle-arrow-left"></span>
        </a></div>
    </div>
    <div class="col-sm-5" align="center">
        <div class="col-sm-6" style="border-radius: 10px; background-color: #f2f2f2">
            <h4>Selected Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
            <table border="0" style="width:100%;margin: 5px" id="tab">
                <%if(module!=null){
                    for(int i=0;i<module.size();i++){
                %>
                <tr id="row${i}">
                    <td><input type="checkbox" name="check" id="checkSelect${i}" value="${module[i]}"></td>
                    <td>
                        <%=module[i]%>
                    </td>
                </tr>
                <%}}%>
            </table>
        </div>
    </div>
</div>
        <input type="hidden" name="data" id="formData">
        <button type="button" class="submitbutton" style="margin-top: 5px;color: white" onclick="act()">Create</button>
    </g:form>
</div>
</body>
</html>