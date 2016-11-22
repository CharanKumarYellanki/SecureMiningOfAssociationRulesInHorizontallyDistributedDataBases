<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 

<%


int user_id=(Integer)session.getAttribute("user_id");

String errorMessage = "";
String statusMessage = "";
String gender = "";
String mobile = "";
String email="";
String age="";
String uname="";
String password="";
String usertype="";

	  
if ("POST".equalsIgnoreCase(request.getMethod())) {

uname=request.getParameter("uname").trim();
gender=request.getParameter("gender").trim();
mobile=request.getParameter("mobile").trim();
email=request.getParameter("email").trim();
password=request.getParameter("password");
age=request.getParameter("age").trim();
usertype="CUSTOMER";

boolean isValid=true;

 

java.util.Date dt = new java.util.Date();
java.text.SimpleDateFormat sdf = 
new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String created_on = sdf.format(dt);


if(uname=="") { isValid=false; errorMessage+="Please enter user name<br>";}
if(password=="") { isValid=false; errorMessage+="Please enter password<br>";}
if(gender=="") { isValid=false;errorMessage+="Please select male or female<br>"; }
   if(age=="") { isValid=false; errorMessage+="Please enter age<br>";}
if(mobile=="") { isValid=false; errorMessage+="Please enter phone<br>";}


Pattern pt=Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"); 
Matcher mt=pt.matcher(email); 
boolean bl=mt.matches(); 
if(bl==true) 
System.out.println("Valid Email ID"+email); 
else {
	errorMessage+="Please enter Valid EmailID<br>";
	 isValid=false; 
}  
		
	if(isValid){
String sql;			
sql="Update users set user_type=?,user_name=?,user_pass=?,user_age=?,user_sex=?,user_email=?,user_mobile=?,user_created_on=? where user_id="+user_id;
//out.print(sql);
 PreparedStatement pstmt=con.prepareStatement(sql);
 

 pstmt.setString(1,usertype);
 pstmt.setString(2,uname);
 pstmt.setString(3,password);
 pstmt.setString(4,age);
 pstmt.setString(5,gender);
 pstmt.setString(6,email);
 pstmt.setString(7,mobile);
 pstmt.setString(8,created_on);

		
		  
         pstmt.executeUpdate();
         statusMessage = "Updated Successfully....!";
		 
		 System.out.println("inserted");
			
		}
		   
		  }
		  
		  
		  

ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `users` WHERE `user_id`="+user_id);	  
 if(rs1.next()) { 

 
 %>	






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>Admin Theme</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/custom.css" type="text/css" media="all" />
</head>
<body>

	<!-- Header -->
	<div id="header">
		<div class="shell">
			
			<div id="head">
				<h1>Secure Mining of Association Rules in Horizontally Distributed Databases</h1>
				
			</div>
			
		</div>
	</div>
	<!-- End Header -->

   <%@ include file="cust_side_bar.jsp" %>    
	
   
		<p id="pagehead"> Customer Edit Profile</p>
        
     	
			
	
		
	
   <form class="form form-aligned" action="" method="post">
      <h3 style="color:#093; width:600px;"><%=statusMessage%></h3> 
              
    <fieldset>
    
       
        
        <div class="control-group">
            <label for="name">Customer Name</label>
            <input id="uname" name="uname" type="text"  value="<%=rs1.getString("user_name")%>"/>
        </div>
        <div class="control-group">
            <label for="password">  Password</label>
            <input id="password"  name="password"type="password"  value="<%=rs1.getString("user_pass")%>"/>
        </div>
        
<%
String mChecked = "";
String fChecked = "";
if(rs1.getString("user_sex").equals("MALE")){
    mChecked = "checked";
}else{
    fChecked = "checked";
}
%>
         <div class="control-group">
            <label for="email">Gender</label>
              <input  type="radio" name="gender" value="Male"  <%=mChecked %> /> Male
              <input type="radio" name="gender" value="Female"  <%=fChecked %> /> Female 
        </div>
         <div class="control-group">
            <label for="email"> Age</label>
            <input id="age" name="age" type="text" value="<%=rs1.getString("user_age")%>"/>
        </div>
          <div class="control-group">
            <label for="email"> Phone</label>
            <input id="mobile" name="mobile" type="text"  value="<%=rs1.getString("user_mobile")%>"/>
        </div>
          <div class="control-group">
            <label for="email"> Email Id</label>
            <input id="email" type="email" name="email" value="<%=rs1.getString("user_email")%>"/>
        </div>
        
  
        
       
        <div class="controls">
            <button type="submit" class="button button-primary">Submit</button>
        </div>
    </fieldset>
</form>
<% } %>
		<div >
       
        </div>
	</div>
	<!-- End Content -->
    
	</div>
    
<div style="clear: both;"></div>
<!-- Footer -->
<div id="footer">

</div>
<!-- End Footer -->

</body>
</html>