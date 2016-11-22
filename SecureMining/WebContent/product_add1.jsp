<%@ include file="includes/DBconnect.jsp" %>
<%	 
if(request.getParameter("id")!=null){
int getId=Integer.parseInt(request.getParameter("id"));

boolean isValid=true;
		  
     //out.print(subject6);
	 int  is_verified=1;
		
	if(isValid){  
String sql;			
sql="Update studentsdata set is_verified=? where  data_id="+getId;
//out.print(sql);
 PreparedStatement pstmt=con.prepareStatement(sql);
		
		 pstmt.setInt(1,is_verified);
         pstmt.executeUpdate();
       //  statusMessage = "Updated Successfully....!";
		 
		 System.out.println("inserted");
	} }
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
				<h1><a href="#">Secure Mining of Association Rules in Horizontally Distributed Databases</a></h1>
			</div>
			
		</div>
	</div>
	<!-- End Header -->
	
    <div class="shell"> 
           
    <div id="sidebar">
    <ul>
    <li><a href="server_data.jsp">Server Home</a></li>
	<li><a href="logout.jsp">Log Out</a></li>
    </ul>
    </div>   
  
<% 
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `studentsdata`");	  
%>  
	<!-- Content -->
	<div id="content">
   
		<p id="pagehead">Server Home</p>

   <table class="table table-bordered" style="width:900px;">
    <thead>
        <tr>
            <th>Student Id</th>
            <th>Subject1</th>
             <th>Subject2</th>
             <th>Subject3</th>
             <th>Subject4</th>
              <th>Subject5</th>
               <th>Subject6</th>
                  <th>Class</th>
                     <th>Year</th>
                       <th>Verify</th>
                     
        </tr>
    </thead>

    <tbody>
       <%  while (rs1.next()) { %>	
       
      
        <tr>
            <td> <%=rs1.getString("data_id")%></td>
            <td> <%=rs1.getString("subject1")%></td>
            <td> <%=rs1.getString("subject2")%></td>
            <td> <%=rs1.getString("subject3")%></td>
            <td> <%=rs1.getString("subject4")%></td>
            <td> <%=rs1.getString("subject5")%></td>
            <td> <%=rs1.getString("subject6")%></td>
            <td> <%=rs1.getString("class")%></td>
            <td> <%=rs1.getString("year")%></td>
             <td> <%if(rs1.getInt("is_verified")==0){out.print("NO");%><a href="server_data.jsp?id=<%=rs1.getString("data_id")%>"
              style="color:#F00">(Verifiy it)</a> <%} else {out.print("YES");} %></td>
       
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