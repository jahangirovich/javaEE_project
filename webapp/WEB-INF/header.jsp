<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>POST_PROJECT</title>
    <link rel="short icon" href="icons/favicon.ico" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400;600&display=swap" rel="stylesheet">    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
    <%@include file="/WEB-INF/css/style.min.css"%>
    <%@include file="/WEB-INF/css/normalize.min.css"%>
    <%@include file="/WEB-INF/css/bootstrap-grid.min.css"%>
    .modal-auth-inner{
        align-items: start;
        justify-content: center;
    }
    .profile 
    label{
        display: block;
        margin-bottom: 5px;
    }
    .details{
        align-items: center;
    }
    .details_inner span{
        line-height: unset !important;
    }
    .details_inner a:hover{
        text-decoration: underline;
    }
    a{
        text-decoration: none;
    }
    .right .auth form input{
        width: 100%;
        background-color: #efefef;
        color: black;
        font-size: 15px;
        padding: 10px 15px;
        border: none;
    }
    </style>
</head>
<body>
    <div class="header">
        <div class="header_inner">
            <div class="left">
                <a href="posts.do" class="icon">POST_PROJECT</a>
                <c:choose>
                    <c:when test="${!empty sessionScope.user}">
                        <div class="isAuth" style="display: inline-block;">
                            <a href="profileshow.do"><i class='fas fa-user-alt'></i><span>Profile</span></a>
                            <a href="" class="create_post"><i class='fas fa-plus'></i><span>Create Post</span></a>
                            <a href="viewrequests.do"><i class='fas fa-paper-plane'></i><span>View requests</span></a>
                            <a href="addfriend.do"><i class='fas fa-plus'></i><span>Add Friend</span></a>
                            <a href="viewfriends.do"><i class='fas fa-users'></i><span>View Friends</span></a>
                        </div>
                    </c:when>
                </c:choose>
                
            </div>
            <div class="right">
                <div class="auth">
                    <c:if test="${empty sessionScope.user}">
                        <a href="login.do" class="login-btn">Login</a>
                        <a href="register.do" class="register-btn">Register</a>
                    </c:if>
                    <c:if test="${!empty sessionScope.user}">
                        <form action="logout.do" method="POST">
                            <i class="fa fa-sign-out" aria-hidden="true"></i><input type="submit" value="Logout" class="login-btn"/>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    
