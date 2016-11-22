<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 

<%

		  String errorMessage = "";
          String statusMessage = "";
		  String sendreport="";
		  String ddate="";
		  
		  
		  int pid=Integer.parseInt(request.getParameter("pid"));		  
	      int cid=Integer.parseInt(request.getParameter("id"));
	      

		  if ("POST".equalsIgnoreCase(request.getMethod())) {

		  sendreport=request.getParameter("sendreport");
		  ddate=request.getParameter("ddate");
		 
		  boolean isValid=true;	
		 
		  
		  if(sendreport=="") { isValid=false; errorMessage+="Please enter Sendreport<br>";}
		  if(ddate=="") { isValid=false; errorMessage+="Please enter Delivery Date<br>";}
		 
		   
if(isValid){
String sql;			
sql="UPDATE `buyproducts` SET order_report=?,ddate=?  WHERE buyproduct_id='"+pid+"' ";
//out.print(sql);

 PreparedStatement pstmt=con.prepareStatement(sql); 
          pstmt.setString(1,sendreport);
          pstmt.setString(2,ddate);

		 
		  
         pstmt.executeUpdate();
         statusMessage = "Send Order Report Successfully....!";
		 
		 System.out.println("inserted");
			
		}
		   
		  }
		  

		  ResultSet rs1;
		  rs1 = st.executeQuery("SELECT * FROM `buyproducts` where buyproduct_id='"+pid+"' AND customer_id='"+cid+"' ");
	
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
				<h1 >Secure Mining of Association Rules in Horizontally Distributed Databases</h1>
				
			</div>
			
		</div>
	</div>
	<!-- End Header -->
 <div class="shell"> 
    <div id="sidebar">
    <ul>
    <li><a href="view_purchase.jsp">View Purchase Products</a></li>
    <li><a href="view_order.jsp">View Order Products</a></li>
	<li><a href="process_order.jsp">Process Order Products</a></li>
	<li><a href="logout.jsp">Log Out</a></li>
    </ul>
    </div>      
	<!-- Content -->
	<div id="content">
		<p id="pagehead">Send Product Orders Report</p>
        
     	
		
	
   <form class="form form-aligned" action="" method="post">
      <h3 style="color:#093; width:600px;"><%=statusMessage%></h3> 
                <h5 style="color:#F00; width:600px;"><%=errorMessage%></h5> 
    <fieldset>
    
       
       
        <div class="control-group">
            <label for="name">Customer Name</label>
           <% if(rs1.next()){ %><strong><%=rs1.getString("customer_name")%></strong>  <% } %>
        </div>
        
       
        <div class="control-group">
            <label for="password">Send Order Report</label>
           <textarea rows="5" cols="5" name="sendreport"></textarea>
        </div>
         
         
        <div class="control-group">
        <label for="password">Delivery Date</label>
        <input type="text" name="ddate" placeholder="DD-MM-YYYY"  />
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