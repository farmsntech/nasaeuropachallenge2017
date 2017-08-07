<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%double nuer=94224929; %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
var n=123;
	jQuery(document).ready(function($) {
	  $.ajax({
		 
		 
	  url : "http://api.textlocal.in/send/?username=ankuragrawal72@gmail.com&hash=970b3ad8544816b36d877db24ed61fb0e44c439044224a355f4632eab7fabead&sender=TXTLCL&numbers=9425624929&message=Your One Time Password is"+n+"",
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp = parsed_json['balance'];
			alert(temp);	
		  }
	  });
	});
	</script>

</body>
</html>