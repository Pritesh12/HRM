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

    window.onload=function(){
    var data=[];
        var length=${module.size()}
        var i;
        for (j = 0; j < length; j++) {
        document.getElementById("row"+j).style.display='none';
        }
    }
    function moduleSelect(){
        var arr=[];
        var no=0;
        <%if(module!=null){
            for(int i=0;i<module.size();i++){
        %>
        if(document.getElementById('checkAvailable${i}').checked){
            document.getElementById("row${i}").style.display='block';
            arr[no]=document.getElementById('checkAvailable${i}').value;
            document.getElementById("rowAvailable${i}").style.display='none';
            document.getElementById("checkAvailable${i}").checked = false;
            no++;

        }
        <%}}%>
        data=arr;

    }
    function moduleRemove() {
        <%if(module!=null){
            for(int i=0;i<module.size();i++){
        %>
        if(document.getElementById('checkSelect${i}').checked){
            var value=document.getElementById('checkSelect${i}').value;
            var index = data.indexOf(value);
            if (index > -1) {
                data.splice(index, 1);
            }
            document.getElementById("row${i}").style.display='none';
            document.getElementById("rowAvailable${i}").style.display='block';
            document.getElementById("checkSelect${i}").checked = false;
        }
        <%}}%>
    }
    function act(){
        document.getElementById('formData').value=data;
        document.getElementById("compForm").submit();
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
    <h2 style="margin-top: 5px;margin-bottom: 5px">Create Company</h2>
    <g:form name="compForm" url="[controller:'saveComp', action:'newComp']">
        <input type="text" placeholder="Company Name" name="companyName" required value="GrailsBrains">
        <input type="text" placeholder="Tax Id" name="taxId" required value="123">
        <input type="text" placeholder="Company Status" name="companyStatus" required value="Stat">
        <input type="text" placeholder="Registration No." name="registrationNo" required value="987456">
        <input type="email" placeholder="Email" name="email" required value="aaa@gmail.com">
        <input type="text" placeholder="Phone" name="phone" required value="9876543210">
        <input type="text" placeholder="Address" name="address" required value="Vinayaka Nagar">
        <input type="text" placeholder="City" name="city" required value="Bangalore">
        <input type="text" placeholder="State" name="state" required value="Karnataka">
        <input type="text" placeholder="Country" name="country" required value="India">
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
        <button type="button" style="margin-top: 5px;color: white" onclick="act()">Create</button>
    </g:form>
</div>
</body>
</html>