<%@ page import="java.util.*" %>
<html>
<body>

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
<input id="fileUpload" type="file" name="excelfile"/>
<br />
<span id="lblError" style="color: red;"></span>
<br />
<input type="submit" id="btnUpload" value="Upload" />
</form>

</body>
</html>

