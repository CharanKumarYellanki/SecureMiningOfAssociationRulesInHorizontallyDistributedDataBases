

      <%@ include file="includes/DBconnect.jsp" %>
	  <%
		  String lusername = "";
		  String lpassword = "";
		  String lerror = "";
		  String lstatusMessage = "";
		  
           if ("POST".equalsIgnoreCase(request.getMethod())) {
		  lusername = request.getParameter("lusername").trim();    
		   lpassword = request.getParameter("lpassword").trim();
		  boolean isValid = true;
		  if(lusername == "") {
		  isValid = false;
		  lerror += "please enter username<br>";
		  }	
		  if(lpassword == "") {
		  isValid = false;
		  lerror += "please enter password<br>";
		  }
		  
		  if(isValid) {	
		  ResultSet rs1;
				  rs1 = st.executeQuery("select * from users where user_name='" + lusername + "' and user_pass='" + lpassword + "' and user_type='CUSTOMER'");
		  if (rs1.next()) {
		  session.setAttribute("lusername", lusername);
		  session.setAttribute("user_id", rs1.getInt("user_id"));
		  response.sendRedirect("products_search.jsp");
		  } else {
		  lstatusMessage = "Invalid login credentials";
		  }		
		  }//if
		  }//else


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
	
    <div class="shell"> 
           
       <%@ include file="side_bar.jsp" %> 
    
	<!-- Content -->
	<div id="content">
   
		<p id="pagehead">Customer Login</p>
               <form class="form form-aligned" action="" method="post">
                <h3 style="color:#F00; width:600px;"><%=lstatusMessage%></h3> 
                <h5 style="color:#F00; width:600px;"><%=lerror%></h5> 
             <fieldset>
        <div class="control-group">
            <label for="name">User Id</label>
            <input id="lusername" name="lusername" type="text" placeholder="Username">
        </div>

        <div class="control-group">
            <label for="password">Password</label>
            <input id="lpassword" name="lpassword" type="password" placeholder="Password">
        </div>
        
       
        <div class="controls">
         
            <button type="submit" class="button button-primary">Submit</button>

        </div>
    </fieldset>
</form>

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