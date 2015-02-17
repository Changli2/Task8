<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" method="post" action="signIn.do">
				<div class="form-group">
					 <label for="exampleInputEmail1">Username</label>
					 
					 <div class="input-group">
  <span class="input-group-addon" id="sizing-addon2">@</span>
  <input type="text" class="form-control" name= "userName" placeholder="Username" aria-describedby="sizing-addon2">
</div>

				</div>
				
				<div class="form-group">
					 <label for="exampleInputPassword1">Password</label><input type="password" name = "password" class="form-control" id="exampleInputPassword1" />
				</div>
				<!-- <div class="form-group">
					 <label for="exampleInputFile">Login As</label>
					 <div class="btn-group">
  
 
</div> -->
					<p class="help-block">
						One entry for both customers and employees
					</p>
				 <button type="submit" name="button" class="btn btn-default">SignIn with twitter</button>
			</form>
</body>
</html>