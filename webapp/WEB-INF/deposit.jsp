<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Header</title>
  </head>
  <body>
    <div class="main">
        <div class="content">
            <div class="sidebar">
              <ul>
                <li><a href="/web-app/register"> Create Account</a></li>
                <li class="active"><a href="/web-app/addDeposit">Deposit money </a></li>
                <li><a href="/web-app/addFund">Create fund</a></li>
              </ul>
            </div>
            <div class="content_inner">
                
                <form action="posts.do" method="post" enctype="multipart/form-data">
                  Select File to Upload:<input type="file" name="fileName">
                  <br>
                  <input type="text" name="ss"/>
                  <input type="submit" value="Upload">
                </form>
            </div>
        </div>
    </div>
  </body>
</html>
