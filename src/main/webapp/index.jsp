<%@ page import="java.util.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body, html {
  height: 100%;
  margin: 5px;
}
.button {
  background-color: #000000;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.bg {
  /* The image used */
  background-image: url("https://sampleprojectforsigninusers.s3.ap-south-1.amazonaws.com/im.png");

  /* Full height */
  height: 50%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

body {
  background-color: lightblue;
}


</style>
</head>
<body>
<div class="bg"></div>
<center>
<h2><b>Please Upload the Excel file for Ingram Micro Azure Reserved Instances Recommendation Report</b></h2>
<form action="fileupload" method="post"  enctype="multipart/form-data">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("body").on("click", "#btnUpload", function () {
        var allowedFiles = [".xlsx",];
        var fileUpload = $("#fileUpload");
        var lblError = $("#lblError");
        var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
        if (!regex.test(fileUpload.val().toLowerCase())) {
            lblError.html("Please upload file having extensions: <b>" + allowedFiles.join(', ') + "</b> only.");
            return false;
        }
        lblError.html('');
        return true;
    });
</script>
<input id="fileUpload" type="file" class="custom-file-input" name="excelfile"/>
<br />
<span id="lblError" style="color: red;"></span>
<br />
<input type="submit" class="button" id="btnUpload" value="Upload" />
</form>
</center>
</body>
</html>
