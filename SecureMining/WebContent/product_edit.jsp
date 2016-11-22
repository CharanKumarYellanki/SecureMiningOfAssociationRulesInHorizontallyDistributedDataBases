<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 

<%!
public boolean isInteger(String s) {
	System.out.println("in Isinteger()");
	try{
		Integer.parseInt(s);
	} catch (NumberFormatException e) {
		return false;
	}
	return true;
}
%>

<%

int getId=Integer.parseInt(request.getParameter("id"));

		  String errorMessage = "";
		  String statusMessage = "";
		
		  
			  
		  if ("POST".equalsIgnoreCase(request.getMethod())) {
		 
		  String product_name=request.getParameter("product_name").trim();
		  String product_price=request.getParameter("product_price").trim();
		  String product_mdate=request.getParameter("product_mdate").trim();
		  String  product_edate=request.getParameter("product_edate").trim();
		 
		  boolean isValid=true;
		  
     //out.print(subject6);
		
	if(isValid){
String sql;			
sql="Update products set product_name=?,product_price=?,product_mdate=?,product_edate=? where product_id="+getId;
//out.print(sql);
 PreparedStatement pstmt=con.prepareStatement(sql);
 
          pstmt.setString(1,product_name);
		  pstmt.setString(2,product_price);
		  pstmt.setString(3,product_mdate);
		  pstmt.setString(4,product_edate);

		
		  
         pstmt.executeUpdate();
         statusMessage = "Updated Successfully....!";
		 
		 System.out.println("inserted");
			
		}
		   
		  }
		  
		  
		  

ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `products` WHERE `product_id`="+getId);	  
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
	
   <%@ include file="admin_side_bar.jsp" %>
   
		<p id="pagehead">Edit Product Details</p>

      <form class="form form-aligned" action="" method="post">
      
        <h3 style="color:#093; width:600px;"><%=statusMessage%></h3> 
        <h5 style="color:#F00; width:600px;"><%=errorMessage%></h5>  
    <fieldset>
              
         
        <div class="control-group">
            <label for="text"></label>
       <span> <img src="images/<%=rs1.getString("product_image_url")%>"></img></span>
        </div>
        
                
          <div class="control-group">
            <label for="text">Product Name</label>
            <input id="product_name"  name="product_name" type="text" value="<%=rs1.getString("product_name")%>" />
        </div>
         
         <div class="control-group">
            <label for="text">Product Price</label>
            <input id="product_price"  name="product_price" type="text" value="<%=rs1.getString("product_price")%>" /><span class="WebRupee"><strong>(&#x20B9;)</strong></span>
        </div>
         <div class="control-group">
            <label for="text">Product Manufacture Date</label>
            <input id="product_mdate"  name="product_mdate" type="text" placeholder="YYYY-MM-DD" value="<%=rs1.getString("product_mdate")%>" /><span>(YYYY-MM-DD)</span>
        </div>
         <div class="control-group">
             <label for="text">Product expiry Date</label>
            <input id="product_edate"  name="product_edate" type="text" placeholder="YYYY-MM-DD" value="<%=rs1.getString("product_edate")%>" /><span>(YYYY-MM-DD)</span>
        </div>
        
        
        
        
        <div class="controls">
         
            <button type="submit" class="button button-secondary">Update Product</button>

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
<%
}
%>
