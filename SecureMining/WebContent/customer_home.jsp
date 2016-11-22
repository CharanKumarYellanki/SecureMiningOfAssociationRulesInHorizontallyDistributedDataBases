<%@ include file="includes/DBconnect.jsp" %>
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
				<h1><a href="#">Secure Mining of Association Rules in Horizontally Distributed Databases</a></h1>
			</div>
			
		</div>
	</div>
	<!-- End Header -->
	
    <div class="shell"> 
           
    <div id="sidebar">
    <ul>
    <li><a href="student_home.jsp">Student Home</a></li>
    <li><a href="view_data.jsp">View Data</a></li>
	<li><a href="logout.jsp">Log Out</a></li>
    </ul>
    </div>   
  
<%
int student_id=(Integer)session.getAttribute("user_id");
//out.print(student_id);
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `studentsdata` WHERE  student_id="+student_id);	  
%>  
	<!-- Content -->
	<div id="content">
   
		<p id="pagehead">Student Home</p>

   <table class="table table-bordered" style="width:750px;">
    <thead>
        <tr>
            <th>Data Id</th>
            <th>Subject1</th>
             <th>Subject2</th>
             <th>Subject3</th>
             <th>Subject4</th>
              <th>Subject5</th>
               <th>Subject6</th>
                  <th>Class</th>
                     <th>Year</th>
                     <th>Verify</th>
                     <th></th>
        </tr>
    </thead>

    <tbody>
       <%  while (rs1.next()) { %>	
        <tr>
            <td> <%=rs1.getString("data_id")%></td>
           <td>-</td>
           <td>-</td>
           <td>-</td>
           <td>-</td>
            <td>-</td>
           <td>-</td>
          <td> <%=rs1.getString("class")%></td>
         <td> <%=rs1.getString("year")%></td>
         <td> <%if(rs1.getInt("is_verified")==0){out.print("NO");} else {out.print("YES");} %></td>
          <td><a href="datakey.jsp" style="color:#F00">GetKey</a></td>
        </tr>
          <% }%>   
    </tbody>
    
</table>

		<div >
       
        </div>
	</div>
	<!-- End Content -->
    
	</div>
    
<div style="clear:both;"></div>
<!-- Footer -->
<div id="footer">
	
</div>
<!-- End Footer -->

</body>
</html>