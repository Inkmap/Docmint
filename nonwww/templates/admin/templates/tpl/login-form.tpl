<style type="text/css">

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 450px;
  width: 100% !important;
  margin: 0 auto;
  border-radius: 2px;
  overflow: hidden;
  font-family: ubuntu;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: ubuntu;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  padding: 10px 0px;
  font-size: 14px;
}

.loginmodal-submit:hover {
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
</style>


<div class="loginmodal-container">
	<h1>Login to Your Account</h1><br>
{if isset($message)}
<div class="alert alert-dismissible {$message.typeClass}">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  {$message.content}
</div>
{/if}  
  <form action="?action=login" id="login" method="post">
	<input type="text" name="usrnm" placeholder="Username">
	<input type="password" name="psswd" placeholder="Password">
	<input type="submit" name="action" class="btn btn-primary" value="Login">
  </form>
	
  {*<div class="login-help">
	<a href="#">Register</a> - <a href="#">Forgot Password</a>
  </div>*}
</div>
