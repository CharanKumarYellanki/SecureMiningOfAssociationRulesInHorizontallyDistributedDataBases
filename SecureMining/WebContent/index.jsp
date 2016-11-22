<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 





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
   
		<p id="pagehead">Distributed Databases</p>
        
     	
			
	
		
	
  <!--<img src="images/mainbg.png"></img>-->
  </br>
    </br>  </br>  </br>
  <h1><marquee>Secure Mining of Association Rules in Horizontally Distributed Databases</marquee></h1>
  
  <% 
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `products`");	  
%>  

   
		<p id="pagehead">Search Products</p>

   <%
String search = "";
if(request.getParameter("s") != null && request.getParameter("s").trim() != "")
	search = request.getParameter("s");
%>
            <div id="site_content">
            <form id="contact" action="" method="get">
            <div class="form_settings">
              <p><input  type="text" name="s" value="<%=search%>" placeholder="Enter Product Name" style="width:350px; height:25px;" border:2px solid #C0C0BC; " />
            <input class="button button-primary"   type="submit"  value="SEARCH" style="" /></p>
            </div>
            </form>
            
            <div class="content">
           <% if(search == "")  { %><% } %>
            
<%
ResultSet rs;
rs=st.executeQuery("SELECT * FROM `products` WHERE product_name LIKE '%"+search+"%' ORDER BY `product_id` DESC ");
while (rs.next()) {
%>  
    

           
             <p>
             <table width="100%">
             <tr>
            <td><a href="images/<%=rs.getString("product_image_url")%>" class="pirobox" title="<%=rs.getString("product_name")%>" ><img   src="images/<%=rs.getString("product_image_url")%>" hieght="100" width="100"/></td>
             <td width="10%"><span class="WebRupee">&#x20B9;<%=rs.getString("product_price")%></span></td>
            <td width="25%"><span> <%=rs.getString("product_name")%></span></td>           
            <td width="20%"><a href="product_buy.jsp?id=<%=rs.getString("product_id")%>" class="button button-warning" >Buy Product</a></td>
            <td width="20%"><a href="product_order.jsp?id=<%=rs.getString("product_id")%>" class="button button-success" >Order Product</a></td>
            </tr>
            </table>
           </p>
           
   
     
<%}%>
             </div>
            </div>


		<div >
       
        </div>
	</div>
	<!-- End Content -->
    
	</div>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/piroBox.1_2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$().piroBox({
			my_speed: 600, //animation speed
			bg_alpha: 0.5, //background opacity
			radius: 4, //caption rounded corner
			scrollImage : false, // true == image follows the page, false == image remains in the same open position
			pirobox_next : 'piro_next', // Nav buttons -> piro_next == inside piroBox , piro_next_out == outside piroBox
			pirobox_prev : 'piro_prev',// Nav buttons -> piro_prev == inside piroBox , piro_prev_out == outside piroBox
			close_all : '.piro_close',// add class .piro_overlay(with comma)if you want overlay click close piroBox
			slideShow : 'slideshow', // just delete slideshow between '' if you don't want it.
			slideSpeed : 4 //slideshow duration in seconds(3 to 6 Recommended)
	});
});
</script>









