<%@ page import="java.util.*" %>
<html>
<body>
<%= (new java.util.Date()) %>
<h2>Hello World! Indrasish</h2>


<form action = "fileupload" method = "post"  enctype="multipart/form-data">
	<label for="excelfile">Select a file:</label>
	<input type="file" id="excelfile" name="excelfile">
	<input type = "submit" value = "Submit" />
</form>
</body>
</html>
