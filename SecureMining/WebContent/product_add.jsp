<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="admin_side_bar.jsp" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>


 <% 

		  String errorMessage = "";
		  String statusMessage = "";
		  String uploadFilename = "";
		  String product_name="";
		  String product_price="";
		  String product_mdate="";
		  String product_edate="";
		  int users_user_id=1;
	
		  final String UPLOAD_PATH = config.getServletContext().getRealPath("/")+"images/";
		  boolean isUploaded = false;

		  // Check that we have a file upload request
		  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		  
		  if(isMultipart) {
				// Create a factory for disk-based file items
				FileItemFactory factory = new DiskFileItemFactory();
				
				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				try {
					// Parse the request
					List<FileItem> items = upload.parseRequest(request);
					int inc = 0;
					for (FileItem item : items) {
						 // processes only fields that are not form fields
						if (!item.isFormField()) {
							//this will be true if file field is found in the List
							uploadFilename = item.getName();
							try {
							File savedFile = new File(UPLOAD_PATH+uploadFilename);
							item.write(savedFile);
							isUploaded = true;
							} catch(FileNotFoundException e) {
							isUploaded = false;
							}
						} else {
							//here...
							String fieldname = item.getFieldName();
							//System.out.print("FieldName : "+fieldname);
							String fieldvalue = item.getString();
							
							
							
							
							//System.out.println(" Value: "+fieldvalue);

					        if (fieldname.equals("product_name")) {
					        	 product_name = fieldvalue;
							}
					      else if (fieldname.equals("product_price")) {
					    	  product_price = fieldvalue;
							}
					      else if (fieldname.equals("product_mdate")) {
					    	  product_mdate = fieldvalue;
							}
					      else if (fieldname.equals("product_edate")) {
					    	  product_edate = fieldvalue;
							}
					      else{
					      }
					  
							 
							
						}
					}
				}//try
				catch (FileUploadException e) {
					e.printStackTrace();
					} 
		  
				if(isUploaded){

String sql;			
sql="INSERT INTO `products`(`product_id`, `product_name`, `product_image_url`, `product_price`, `product_mdate`, `product_edate`, `users_user_id`) VALUES (Null,?,?,?,?,?,?)";
//out.print(sql);

 PreparedStatement pstmt=con.prepareStatement(sql);
 
          pstmt.setString(1,product_name);
		  pstmt.setString(2,uploadFilename);
		  pstmt.setString(3,product_price);
		  pstmt.setString(4,product_mdate);
		  pstmt.setString(5,product_edate);
		  pstmt.setInt(6,users_user_id);

		
		  
         pstmt.executeUpdate();
         statusMessage = "Added Successfully....!";
		 
		 System.out.println("inserted");

		}
		   
		  }
		  
%>




   
		<p id="pagehead">Add Product Details</p>
        
     	
			
	
		
	
      <form class="form form-aligned" action="" method="post" enctype="multipart/form-data">
      
        <h3 style="color:#093; width:600px;"><%=statusMessage%></h3> 
        <h5 style="color:#F00; width:600px;"><%=errorMessage%></h5>  
      <fieldset>
        <div class="control-group">
            
        <div class="control-group">
            <label for="text">Product Name</label>
            <input id="product_name"  name="product_name" type="text" >
        </div>
         <div class="control-group">
            <label for="text">Product Image</label>
            <input id="product_image_url"  name="product_image_url" type="file" >
        </div>
         <div class="control-group">
            <label for="text">Product Price</label>
            <input id="product_price"  name="product_price" type="text" ><span class="WebRupee"><strong>(&#x20B9;)</strong></span>
        </div>
         <div class="control-group">
            <label for="text">Product Manufacture Date</label>
            <input id="product_mdate"  name="product_mdate" type="text" placeholder="YYYY-MM-DD"><span>(YYYY-MM-DD)</span>
        </div>
         <div class="control-group">
             <label for="text">Product expiry Date</label>
            <input id="product_edate"  name="product_edate" type="text" placeholder="YYYY-MM-DD"><span>(YYYY-MM-DD)</span>
        </div>
     
       
        <div class="controls">
         
            <button type="submit" class="button button-primary">Add Product</button>

        </div>
        	
    </fieldset>
</form>

	<%@ include file="footer.jsp" %>